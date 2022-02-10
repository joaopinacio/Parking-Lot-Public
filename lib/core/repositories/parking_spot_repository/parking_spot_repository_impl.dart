import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:parking_lot/core/model/parking_spot/parking_spot.dart';

import 'parking_spot_repository_interface.dart';

class ParkingSpotRepositoryImpl implements IParkingSpotRepository {
  final Isar isar;

  ParkingSpotRepositoryImpl({required this.isar});

  IsarCollection<ParkingSpot> get parkingSpotCollection => isar.parkingSpots;

  @override
  Stream<List<ParkingSpot>>? getParkingSpots() {
    try {
      return parkingSpotCollection.buildQuery<ParkingSpot>().watch(initialReturn: true);
    } catch (e) {
      if (kDebugMode) print('🟥 ParkingSpotRepositoryImpl.getParkingSpots -> $e');
      return null;
    }
  }

  @override
  Future<List<ParkingSpot>>? getParkingSpotsOnce() {
    try {
      return parkingSpotCollection.buildQuery<ParkingSpot>().findAll();
    } catch (e) {
      if (kDebugMode) print('🟥 ParkingSpotRepositoryImpl.getParkingSpotsOnce -> $e');
      return null;
    }
  }

  @override
  Future<bool> insert({required ParkingSpot data}) async {
    try {
      await isar.writeTxn((isar) async {
        await parkingSpotCollection.put(data);
        await data.vehicle.save();
        await data.parkingLot.save();
      });

      return true;
    } catch (e) {
      if (kDebugMode) print('🟥 ParkingSpotRepositoryImpl.insert -> $e');
      return false;
    }
  }

  @override
  Future<bool> update({required ParkingSpot data}) async {
    try {
      await isar.writeTxn((isar) async {
        await parkingSpotCollection.put(data);
        await data.vehicle.save();
        await data.parkingLot.save();
      });

      return true;
    } catch (e) {
      if (kDebugMode) print('🟥 ParkingSpotRepositoryImpl.update -> $e');
      return false;
    }
  }

  @override
  Future<bool> delete({required int id}) async {
    try {
      await isar.writeTxn((isar) async {
        await parkingSpotCollection.delete(id);
      });

      return true;
    } catch (e) {
      if (kDebugMode) print('🟥 ParkingSpotRepositoryImpl.delete -> $e');
      return false;
    }
  }
}
