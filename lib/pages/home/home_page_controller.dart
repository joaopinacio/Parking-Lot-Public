import 'dart:async';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/model/historic/historic.dart';
import 'package:parking_lot/core/model/parking_lot/parking_lot.dart';
import 'package:parking_lot/core/model/parking_spot/parking_spot.dart';
import 'package:parking_lot/core/model/vehicle/vehicle.dart';
import 'package:parking_lot/core/repositories/historic_repository/historic_repository_interface.dart';
import 'package:parking_lot/core/repositories/parking_lot_repository/parking_lot_repository_interface.dart';
import 'package:parking_lot/core/repositories/parking_spot_repository/parking_spot_repository_interface.dart';
import 'package:parking_lot/core/repositories/vehicle_repository/vehicle_repository_interface.dart';
import 'package:parking_lot/core/router/app_pages.dart';
import 'package:parking_lot/core/utils/app_util.dart';
import 'package:parking_lot/core/widgets/app_modal_bottom_sheet_component.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';

class HomePageController extends GetxController {
  final IParkingLotRepository _parkingLotRepository;
  final IParkingSpotRepository _parkingSpotRepository;
  final IVehicleRepository _vehicleRepository;
  final IHistoricRepository _historicRepository;
  final AppPages _appPages;

  HomePageController({
    required IParkingLotRepository parkingLotRepository,
    required IParkingSpotRepository parkingSpotRepository,
    required IVehicleRepository vehicleRepository,
    required IHistoricRepository historicRepository,
    required AppPages appPages,
  })  : _parkingLotRepository = parkingLotRepository,
        _parkingSpotRepository = parkingSpotRepository,
        _vehicleRepository = vehicleRepository,
        _historicRepository = historicRepository,
        _appPages = appPages;

  late StreamSubscription _parkingSpotStream;
  late StreamSubscription _vehicleStream;

  final codeSpotKey = GlobalKey<FormState>();
  var codeSpotFocusNode = FocusNode();
  TextEditingController codeSpotController = TextEditingController();
  final vehicleUidKey = GlobalKey<FormState>();
  var vehicleUidFocusNode = FocusNode();
  TextEditingController vehicleUidController = TextEditingController();
  final nmOwnerKey = GlobalKey<FormState>();
  var nmOwnerFocusNode = FocusNode();
  TextEditingController nmOwnerController = TextEditingController();

  var parkingLotList = <ParkingLot>[].obs;
  var parkingSpotList = <ParkingSpot>[].obs;
  var vehicleList = <Vehicle>[].obs;

  var parkingSpotListMap = <Map<String, dynamic>>[
    {
      'status': '',
      'time': '',
      'vehicleType': '',
    },
  ].obs;

  var vehicleTypeIndexSelected = 1;
  var vehicleTypes = <Map<String, dynamic>>[
    {
      'type': 'bicycle',
      'name': 'bicycle'.tr,
      'image': AppThemes.images.bicycle,
      'isSelected': false,
    },
    {
      'type': 'car',
      'name': 'car'.tr,
      'image': AppThemes.images.car,
      'isSelected': true,
    },
    {
      'type': 'truck',
      'name': 'truck'.tr,
      'image': AppThemes.images.truck,
      'isSelected': false,
    },
    {
      'type': 'motobike',
      'name': 'motobike'.tr,
      'image': AppThemes.images.motobike,
      'isSelected': false,
    },
  ].obs;

  Timer? timerVehicleSpot;

  var behaviourParkingLot = Behaviour.loading.obs;
  var behaviourParkingSpot = Behaviour.loading.obs;
  var behaviourParkingVehicle = Behaviour.loading.obs;

  var spotSelected = ParkingSpot.init().obs;
  var isSpotSelected = false.obs;
  var selectedSpotBehaviour = Behaviour.empty.obs;

  Behaviour get getBehaviourParkingLot => behaviourParkingLot.value;
  Behaviour get getBehaviourParkingSpot => behaviourParkingSpot.value;
  Behaviour get getBehaviourParkingVehicle => behaviourParkingVehicle.value;

  bool get getIsSpotSelected => isSpotSelected.value;
  Behaviour get getSelectedSpotBehaviour => selectedSpotBehaviour.value;
  ParkingSpot get getSpotSelected => spotSelected.value;

  bool get getSpotSelectedWithVehicle => (getSpotSelected.vehicle.value != null && getIsSpotSelected);

  @override
  void onInit() {
    super.onInit();
    fetchParkingLots();
    isSpotSelected.listen((obj) {
      if (obj) {
        selectedSpotBehaviour.value = Behaviour.regular;
      } else {
        selectedSpotBehaviour.value = Behaviour.empty;
      }
    });
  }

  void showTimer() {
    timerVehicleSpot?.cancel();
    if (getSpotSelected.vehicle.value != null) {
      calcTimeLeft();
      var oneSec = const Duration(seconds: 1);
      timerVehicleSpot = Timer.periodic(
        oneSec,
        (Timer timer) {
          calcTimeLeft();
        },
      );
    }
  }

  void calcTimeLeft() {
    var now = DateTime.now();
    var arrived = DateTime.parse(getSpotSelected.dtVehicleArrived!);

    var difference = now.difference(arrived);

    var time = AppUtil.msToTime(difference.inMilliseconds);

    spotSelected.value.time = time;
    spotSelected.refresh();
  }

  void fetchParkingLots() async {
    parkingLotList.value = await _parkingLotRepository.getParkingLotsOnce()!;
    behaviourParkingLot.value = changeBehaviour(length: parkingLotList.length);

    if (parkingLotList.isEmpty) {
      var parkingLot = ParkingLot()..name = 'mainParkingLot';
      await _parkingLotRepository.insert(data: parkingLot);
      parkingLotList.value = await _parkingLotRepository.getParkingLotsOnce()!;
    }

    fetchParkingSpots();
    fetchVehicles();
  }

  void fetchParkingSpots() {
    _parkingSpotStream = _parkingSpotRepository.getParkingSpots()!.listen(_listenParkingSpotStream);
  }

  void fetchVehicles() {
    _vehicleStream = _vehicleRepository.getVehicles()!.listen(_listenVehicleStream);
  }

  void _listenParkingSpotStream(List<ParkingSpot> list) async {
    if (kDebugMode) print('Parking Spot Length:');
    if (kDebugMode) print(list.length);

    list.sort((a, b) => a.dtInsert.compareTo(b.dtInsert));

    parkingSpotListMap.value = [];
    isSpotSelected.value = false;

    for (var parkingSpot in list) {
      await parkingSpot.vehicle.load();
      var parkingSpotMap = {
        'parkingSpot': parkingSpot,
        'isSelected': false,
      };

      parkingSpotListMap.add(parkingSpotMap);
    }
    parkingSpotListMap.add({
      'parkingSpot': null,
      'isSelected': false,
    });

    parkingSpotListMap.refresh();
    parkingSpotList.value = list;
    behaviourParkingSpot.value = changeBehaviour(length: parkingSpotListMap.length);
  }

  void _listenVehicleStream(List<Vehicle> list) async {
    vehicleList.value = list;
    behaviourParkingVehicle.value = changeBehaviour(length: vehicleList.length);
  }

  Behaviour changeBehaviour({required int length}) {
    switch (length) {
      case 0:
        return Behaviour.empty;
      default:
        return Behaviour.regular;
    }
  }

  void selectSpot(int index) {
    for (var element in parkingSpotListMap) {
      element['isSelected'] = false;
    }
    parkingSpotListMap[index]['isSelected'] = true;

    spotSelected.value = parkingSpotListMap[index]['parkingSpot'];
    spotSelected.refresh();
    isSpotSelected.value = true;
    parkingSpotListMap.refresh();
    showTimer();
  }

  void openParkingSpotAddModal() {
    codeSpotController.text = '';
    AppModalBottomSheetComponent.parkingSpotAdd(
      codeSpotKey: codeSpotKey,
      codeSpotController: codeSpotController,
      codeSpotFocusNode: codeSpotFocusNode,
      codeSpotValidate: codeSpotValidate,
      onTapSave: addParkingSpot,
    );
  }

  void addParkingSpot() async {
    if (codeSpotKey.currentState!.validate()) {
      Get.back();
      var parkingSpot = ParkingSpot()
        ..code = codeSpotController.text
        ..status = 'available'
        ..time = '--'
        ..dtInsert = DateTime.now().toIso8601String();

      parkingSpot.parkingLot.value = parkingLotList[0];

      var result = await _parkingSpotRepository.insert(data: parkingSpot);
      codeSpotController.text = '';
      if (kDebugMode) print('Parking Spot Add:');
      if (kDebugMode) print(result);
    }
  }

  void onCarrouselPageChange(int index, CarouselPageChangedReason reason) {
    for (var vehicle in vehicleTypes) {
      vehicle['isSelected'] = false;
    }

    vehicleTypes[index]['isSelected'] = true;
    vehicleTypeIndexSelected = index;
    vehicleTypes.refresh();
  }

  void openVehicleAddModal() {
    vehicleUidController.text = '';
    nmOwnerController.text = '';
    resetListVehicle();
    AppModalBottomSheetComponent.vehicleAdd(
      vehicleUidKey: vehicleUidKey,
      vehicleUidController: vehicleUidController,
      vehicleUidFocusNode: vehicleUidFocusNode,
      vehicleUidValidate: vehicleUidValidate,
      nmOwnerKey: nmOwnerKey,
      nmOwnerController: nmOwnerController,
      nmOwnerFocusNode: nmOwnerFocusNode,
      nmOwnerValidate: nmOwnerValidate,
      vehicleTypes: vehicleTypes,
      onTapSave: addVehicleToSpot,
      onCarrouselPageChange: onCarrouselPageChange,
    );
  }

  void addVehicleToSpot() async {
    if (vehicleUidKey.currentState!.validate() && nmOwnerKey.currentState!.validate()) {
      Get.back();
      var vehicle = Vehicle()
        ..uid = vehicleUidController.text
        ..type = vehicleTypes[vehicleTypeIndexSelected]['type']
        ..nmOwner = nmOwnerController.text;

      var resultVehicle = await _vehicleRepository.insert(data: vehicle);
      if (kDebugMode) print('Vehicle Insert:');
      if (kDebugMode) print(resultVehicle);

      spotSelected.value.vehicle.value = vehicle;
      spotSelected.value.status = 'unavailable';
      spotSelected.value.dtVehicleArrived = DateTime.now().toIso8601String();

      var resultParkingSpot = await _parkingSpotRepository.update(data: getSpotSelected);

      if (kDebugMode) print('Parking Spot Update:');
      if (kDebugMode) print(resultParkingSpot);

      var historic = Historic()
        ..status = 'entry'
        ..dtInsert = DateTime.now().toIso8601String()
        ..date = AppUtil.toOnlyDate(DateTime.now());

      historic.parkingLot.value = parkingLotList[0];
      historic.vehicle.value = vehicle;
      historic.parkingSpot.value = spotSelected.value;

      var resultHistoric = await _historicRepository.insert(data: historic);

      if (kDebugMode) print('Historic Insert:');
      if (kDebugMode) print(resultHistoric);
    }
  }

  void removeVehicleFromSpot() async {
    var historic = Historic()
      ..status = 'departure'
      ..dtInsert = DateTime.now().toIso8601String()
      ..date = AppUtil.toOnlyDate(DateTime.now())
      ..busyTime = spotSelected.value.time;

    historic.parkingLot.value = parkingLotList[0];
    historic.vehicle.value = spotSelected.value.vehicle.value;
    historic.parkingSpot.value = spotSelected.value;

    var resultHistoric = await _historicRepository.insert(data: historic);

    if (kDebugMode) print('Historic Insert:');
    if (kDebugMode) print(resultHistoric);

    spotSelected.value.vehicle.value = null;
    spotSelected.value.status = 'available';
    spotSelected.value.dtVehicleArrived = null;
    spotSelected.value.time = '--';

    var result = await _parkingSpotRepository.update(data: getSpotSelected);

    timerVehicleSpot?.cancel();

    if (kDebugMode) print('(Remove Vehicle) Parking Spot Update:');
    if (kDebugMode) print(result);
  }

  void blockOrUnblockSpot() async {
    if (spotSelected.value.status == 'blocked') {
      spotSelected.value.status = 'available';
    } else {
      spotSelected.value.status = 'blocked';
    }

    var result = await _parkingSpotRepository.update(data: getSpotSelected);

    if (kDebugMode) print('(blockOrUnblockSpot) Parking Spot Update:');
    if (kDebugMode) print(result);
  }

  String getVehicleType(ParkingSpot parkingSpot) {
    var vehicle = parkingSpot.vehicle.value;
    if (vehicle != null) {
      return vehicle.type;
    }
    return '';
  }

  String? codeSpotValidate(String? value) {
    String? result;
    if (value == null || value == '') {
      codeSpotFocusNode.requestFocus();
      result = 'required_field'.tr;
    }

    for (var parkingSpot in parkingSpotList) {
      if (value == parkingSpot.code) {
        result = 'code_already_exists'.tr;
        break;
      }
    }

    return result;
  }

  String? vehicleUidValidate(String? value) {
    String? result;
    if (value == null || value == '') {
      vehicleUidFocusNode.requestFocus();
      result = 'required_field'.tr;
    }

    for (var parkingSpot in parkingSpotList) {
      if (parkingSpot.vehicle.value != null) {
        if (parkingSpot.vehicle.value!.uid == value) {
          result = 'vehicle_in_spot'.tr;
        }
        break;
      }
    }

    return result;
  }

  String? nmOwnerValidate(String? value) {
    String? result;
    if (value == null || value == '') {
      nmOwnerFocusNode.requestFocus();
      result = 'required_field'.tr;
    }

    return result;
  }

  void resetListVehicle() {
    for (var vehicle in vehicleTypes) {
      vehicle['isSelected'] = false;
    }

    vehicleTypes[1]['isSelected'] = true;
    vehicleTypeIndexSelected = 1;
    vehicleTypes.refresh();
  }

  void toHistoricPage() {
    Get.toNamed(_appPages.historic);
  }

  void deteleAllSpots() async {
    for (var element in parkingSpotList) {
      await _parkingSpotRepository.delete(id: element.id!);
    }
  }

  @override
  void onClose() {
    super.onClose();
    _parkingSpotStream.cancel();
    _vehicleStream.cancel();
    timerVehicleSpot?.cancel();
  }
}
