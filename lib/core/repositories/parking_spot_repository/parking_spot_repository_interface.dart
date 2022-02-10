import 'package:parking_lot/core/model/parking_spot/parking_spot.dart';

abstract class IParkingSpotRepository {
  Stream<List<ParkingSpot>>? getParkingSpots();
  Future<List<ParkingSpot>>? getParkingSpotsOnce();
  Future<bool> insert({required ParkingSpot data});
  Future<bool> update({required ParkingSpot data});
  Future<bool> delete({required int id});
}
