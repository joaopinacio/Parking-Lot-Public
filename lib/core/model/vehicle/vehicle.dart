import 'package:isar/isar.dart';

part 'vehicle.g.dart';

@Collection()
class Vehicle {
  @Id()
  int? id;

  late String uid;
  late String type;
  late String nmOwner;
}
