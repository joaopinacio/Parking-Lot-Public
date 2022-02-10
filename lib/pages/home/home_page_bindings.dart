import 'package:parking_lot/core/classes/core_bindings.dart';
import 'package:get/get.dart';
import 'package:parking_lot/core/repositories/historic_repository/historic_repository_impl.dart';
import 'package:parking_lot/core/repositories/historic_repository/historic_repository_interface.dart';
import 'package:parking_lot/core/repositories/parking_lot_repository/parking_lot_repository_impl.dart';
import 'package:parking_lot/core/repositories/parking_lot_repository/parking_lot_repository_interface.dart';
import 'package:parking_lot/core/repositories/parking_spot_repository/parking_spot_repository_impl.dart';
import 'package:parking_lot/core/repositories/parking_spot_repository/parking_spot_repository_interface.dart';
import 'package:parking_lot/core/repositories/vehicle_repository/vehicle_repository_impl.dart';
import 'package:parking_lot/core/repositories/vehicle_repository/vehicle_repository_interface.dart';

import 'home_page_controller.dart';

class HomePageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(
      () => HomePageController(
        parkingLotRepository: Get.find(),
        parkingSpotRepository: Get.find(),
        vehicleRepository: Get.find(),
        historicRepository: Get.find(),
        appPages: Get.find(),
      ),
      fenix: true,
    );
  }

  @override
  void registerRepositories() {
    Get.put<IParkingLotRepository>(
      ParkingLotRepositoryImpl(isar: Get.find()),
    );
    Get.put<IParkingSpotRepository>(
      ParkingSpotRepositoryImpl(isar: Get.find()),
    );
    Get.put<IVehicleRepository>(
      VehicleRepositoryImpl(isar: Get.find()),
    );
    Get.put<IHistoricRepository>(
      HistoricRepositoryImpl(isar: Get.find()),
    );
  }
}
