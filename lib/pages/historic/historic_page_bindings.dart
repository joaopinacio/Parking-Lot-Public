import 'package:parking_lot/core/classes/core_bindings.dart';
import 'package:get/get.dart';
import 'package:parking_lot/core/repositories/historic_repository/historic_repository_impl.dart';
import 'package:parking_lot/core/repositories/historic_repository/historic_repository_interface.dart';

import 'historic_page_controller.dart';

class HistoricPageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(
      () => HistoricPageController(
        historicRepository: Get.find(),
      ),
      fenix: true,
    );
  }

  @override
  void registerRepositories() {
    Get.put<IHistoricRepository>(
      HistoricRepositoryImpl(isar: Get.find()),
    );
  }
}
