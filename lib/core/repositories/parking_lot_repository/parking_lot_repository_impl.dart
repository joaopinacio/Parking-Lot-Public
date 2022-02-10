import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:parking_lot/core/model/parking_lot/parking_lot.dart';

import 'parking_lot_repository_interface.dart';

class ParkingLotRepositoryImpl implements IParkingLotRepository {
  final Isar isar;

  ParkingLotRepositoryImpl({required this.isar});

  IsarCollection<ParkingLot> get parkingLotCollection => isar.parkingLots;

  @override
  Stream<List<ParkingLot>>? getParkingLots() {
    try {
      return parkingLotCollection.buildQuery<ParkingLot>().watch(initialReturn: true);
    } catch (e) {
      if (kDebugMode) print('🟥 ParkingLotRepositoryImpl.getParkingLots -> $e');
      return null;
    }
  }

  @override
  Future<List<ParkingLot>>? getParkingLotsOnce() {
    try {
      return parkingLotCollection.buildQuery<ParkingLot>().findAll();
    } catch (e) {
      if (kDebugMode) print('🟥 ParkingLotRepositoryImpl.getParkingLotsOnce -> $e');
      return null;
    }
  }

  @override
  Future<bool> insert({required ParkingLot data}) async {
    try {
      await isar.writeTxn((isar) async {
        await parkingLotCollection.put(data);
      });

      return true;
    } catch (e) {
      if (kDebugMode) print('🟥 ParkingLotRepositoryImpl.insert -> $e');
      return false;
    }
  }

  @override
  Future<bool> update({required ParkingLot data}) async {
    try {
      await isar.writeTxn((isar) async {
        await parkingLotCollection.put(data);
      });

      return true;
    } catch (e) {
      if (kDebugMode) print('🟥 ParkingLotRepositoryImpl.update -> $e');
      return false;
    }
  }

  @override
  Future<bool> delete({required int id}) async {
    try {
      await isar.writeTxn((isar) async {
        await parkingLotCollection.delete(id);
      });

      return true;
    } catch (e) {
      if (kDebugMode) print('🟥 ParkingLotRepositoryImpl.delete -> $e');
      return false;
    }
  }
}
