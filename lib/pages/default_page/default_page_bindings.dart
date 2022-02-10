import 'package:parking_lot/core/classes/core_bindings.dart';
import 'package:get/get.dart';

import 'default_page_controller.dart';

class DefaultPageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(() => DefaultPageController(), fenix: true);
  }

  @override
  void registerRepositories() {}
}
