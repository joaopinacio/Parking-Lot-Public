import 'package:parking_lot/core/model/historic/historic.dart';

abstract class IHistoricRepository {
  Stream<List<Historic>>? getHistorics();
  Stream<List<Historic>>? getTodayHistorics();
  Stream<List<Historic>>? getHistoricsByDate({required DateTime date});
  Future<List<Historic>>? getHistoricsOnce();
  Future<bool> insert({required Historic data});
  Future<bool> update({required Historic data});
  Future<bool> delete({required int id});
}
