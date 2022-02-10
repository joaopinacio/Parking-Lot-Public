import 'package:get/instance_manager.dart';

abstract class CoreBindings implements Bindings {
  @override
  void dependencies();

  void registerRepositories();

  void registerControllers();
}
