import 'package:isar/isar.dart';

part 'parking_lot.g.dart';

@Collection()
class ParkingLot {
  @Id()
  int? id;

  late String name;
}
