import 'package:isar/isar.dart';
import 'package:parking_lot/core/classes/core_bindings.dart';
import 'package:get/get.dart';
import 'package:parking_lot/core/classes/isar_dao.dart';

import 'splash_page_controller.dart';

class SplashPageBindings implements CoreBindings {
  @override
  void dependencies() async {
    registerControllers();
    await registerRepositories();
  }

  @override
  void registerControllers() {
    Get.put(SplashPageController(appPages: Get.find()));
  }

  @override
  Future<void> registerRepositories() async {
    await Get.putAsync<Isar>(() => IsarDAO.instance(), permanent: true);
  }
}
