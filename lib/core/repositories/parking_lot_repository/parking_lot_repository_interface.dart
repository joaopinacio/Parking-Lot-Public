import 'package:parking_lot/core/model/parking_lot/parking_lot.dart';

abstract class IParkingLotRepository {
  Stream<List<ParkingLot>>? getParkingLots();
  Future<List<ParkingLot>>? getParkingLotsOnce();
  Future<bool> insert({required ParkingLot data});
  Future<bool> update({required ParkingLot data});
  Future<bool> delete({required int id});
}
