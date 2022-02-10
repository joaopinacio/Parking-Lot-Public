import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:parking_lot/core/model/vehicle/vehicle.dart';

import 'vehicle_repository_interface.dart';

class VehicleRepositoryImpl implements IVehicleRepository {
  final Isar isar;

  VehicleRepositoryImpl({required this.isar});

  IsarCollection<Vehicle> get vehicleCollection => isar.vehicles;

  @override
  Stream<List<Vehicle>>? getVehicles() {
    try {
      return vehicleCollection.buildQuery<Vehicle>().watch(initialReturn: true);
    } catch (e) {
      if (kDebugMode) print('🟥 VehicleRepositoryImpl.getVehicles -> $e');
      return null;
    }
  }

  @override
  Future<List<Vehicle>>? getVehiclesOnce() {
    try {
      return vehicleCollection.buildQuery<Vehicle>().findAll();
    } catch (e) {
      if (kDebugMode) print('🟥 VehicleRepositoryImpl.getVehiclesOnce -> $e');
      return null;
    }
  }

  @override
  Future<bool> insert({required Vehicle data}) async {
    try {
      await isar.writeTxn((isar) async {
        await vehicleCollection.put(data);
      });

      return true;
    } catch (e) {
      if (kDebugMode) print('🟥 VehicleRepositoryImpl.insert -> $e');
      return false;
    }
  }

  @override
  Future<bool> update({required Vehicle data}) async {
    try {
      await isar.writeTxn((isar) async {
        await vehicleCollection.put(data);
      });

      return true;
    } catch (e) {
      if (kDebugMode) print('🟥 VehicleRepositoryImpl.update -> $e');
      return false;
    }
  }

  @override
  Future<bool> delete({required int id}) async {
    try {
      await isar.writeTxn((isar) async {
        await vehicleCollection.delete(id);
      });

      return true;
    } catch (e) {
      if (kDebugMode) print('🟥 VehicleRepositoryImpl.delete -> $e');
      return false;
    }
  }
}
