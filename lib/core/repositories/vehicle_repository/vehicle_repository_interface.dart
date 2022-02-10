import 'package:parking_lot/core/model/vehicle/vehicle.dart';

abstract class IVehicleRepository {
  Stream<List<Vehicle>>? getVehicles();
  Future<List<Vehicle>>? getVehiclesOnce();
  Future<bool> insert({required Vehicle data});
  Future<bool> update({required Vehicle data});
  Future<bool> delete({required int id});
}
