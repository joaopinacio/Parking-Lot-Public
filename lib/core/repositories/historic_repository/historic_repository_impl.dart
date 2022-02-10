import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:parking_lot/core/model/historic/historic.dart';
import 'package:parking_lot/core/utils/app_util.dart';

import 'historic_repository_interface.dart';

class HistoricRepositoryImpl implements IHistoricRepository {
  final Isar isar;

  HistoricRepositoryImpl({required this.isar});

  IsarCollection<Historic> get historicCollection => isar.historics;

  @override
  Stream<List<Historic>>? getHistorics() {
    try {
      return historicCollection.buildQuery<Historic>().watch(initialReturn: true);
    } catch (e) {
      if (kDebugMode) print('🟥 HistoricRepositoryImpl.getHistorics -> $e');
      return null;
    }
  }

  @override
  Stream<List<Historic>>? getTodayHistorics() {
    try {
      return historicCollection
          .filter()
          .dateEqualTo(
            AppUtil.toOnlyDate(DateTime.now()),
          )
          .watch(initialReturn: true);
    } catch (e) {
      if (kDebugMode) print('🟥 HistoricRepositoryImpl.getHistorics -> $e');
      return null;
    }
  }

  @override
  Stream<List<Historic>>? getHistoricsByDate({required DateTime date}) {
    try {
      return historicCollection
          .filter()
          .dateEqualTo(
            AppUtil.toOnlyDate(date),
          )
          .watch(initialReturn: true);
    } catch (e) {
      if (kDebugMode) print('🟥 HistoricRepositoryImpl.getHistorics -> $e');
      return null;
    }
  }

  @override
  Future<List<Historic>>? getHistoricsOnce() {
    try {
      return historicCollection.buildQuery<Historic>().findAll();
    } catch (e) {
      if (kDebugMode) print('🟥 HistoricRepositoryImpl.getHistoricsOnce -> $e');
      return null;
    }
  }

  @override
  Future<bool> insert({required Historic data}) async {
    try {
      await isar.writeTxn((isar) async {
        await historicCollection.put(data);
        await data.vehicle.save();
        await data.parkingLot.save();
        await data.parkingSpot.save();
      });

      return true;
    } catch (e) {
      if (kDebugMode) print('🟥 HistoricRepositoryImpl.insert -> $e');
      return false;
    }
  }

  @override
  Future<bool> update({required Historic data}) async {
    try {
      await isar.writeTxn((isar) async {
        await historicCollection.put(data);
        await data.vehicle.save();
        await data.parkingLot.save();
        await data.parkingSpot.save();
      });

      return true;
    } catch (e) {
      if (kDebugMode) print('🟥 HistoricRepositoryImpl.update -> $e');
      return false;
    }
  }

  @override
  Future<bool> delete({required int id}) async {
    try {
      await isar.writeTxn((isar) async {
        await historicCollection.delete(id);
      });

      return true;
    } catch (e) {
      if (kDebugMode) print('🟥 HistoricRepositoryImpl.delete -> $e');
      return false;
    }
  }
}
