import 'package:isar/isar.dart';
import 'package:parking_lot/core/model/parking_lot/parking_lot.dart';
import 'package:parking_lot/core/model/parking_spot/parking_spot.dart';
import 'package:parking_lot/core/model/vehicle/vehicle.dart';

part 'historic.g.dart';

@Collection()
class Historic {
  @Id()
  int? id;
  late String status;
  late String dtInsert;
  late String date;
  String? busyTime;

  final parkingSpot = IsarLink<ParkingSpot>();
  final vehicle = IsarLink<Vehicle>();
  final parkingLot = IsarLink<ParkingLot>();
}
