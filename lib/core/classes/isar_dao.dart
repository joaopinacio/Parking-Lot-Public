import 'package:isar/isar.dart';
import 'package:parking_lot/core/model/historic/historic.dart';
import 'package:parking_lot/core/model/parking_lot/parking_lot.dart';
import 'package:parking_lot/core/model/parking_spot/parking_spot.dart';
import 'package:parking_lot/core/model/vehicle/vehicle.dart';
import 'package:path_provider/path_provider.dart';

class IsarDAO {
  IsarDAO._();

  static Future<Isar> instance() async {
    final dir = await getApplicationSupportDirectory(); // path_provider package
    final isar = await Isar.open(
      schemas: [ParkingLotSchema, ParkingSpotSchema, VehicleSchema, HistoricSchema],
      directory: dir.path,
    );

    return isar;
  }
}
