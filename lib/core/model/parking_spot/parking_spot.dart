import 'package:isar/isar.dart';
import 'package:parking_lot/core/model/parking_lot/parking_lot.dart';
import 'package:parking_lot/core/model/vehicle/vehicle.dart';

part 'parking_spot.g.dart';

@Collection()
class ParkingSpot {
  @Id()
  int? id;
  late String code;
  late String status;
  late String dtInsert;
  //late String idVehicle;
  //late String idParkingLot;
  String? dtVehicleArrived;
  String? time;

  final vehicle = IsarLink<Vehicle>();
  final parkingLot = IsarLink<ParkingLot>();

  static ParkingSpot init() {
    return ParkingSpot()
      ..code = ''
      ..status = ''
      ..time = '';
  }
}
