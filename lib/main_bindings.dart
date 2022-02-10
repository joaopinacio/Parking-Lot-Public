import 'package:parking_lot/core/classes/core_bindings.dart';
import 'package:parking_lot/core/router/app_pages.dart';
import 'package:get/get.dart';

class MainBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
  }

  @override
  void registerControllers() {}

  @override
  void registerRepositories() {
    Get.put(AppPages.instance, permanent: true);
  }
}
