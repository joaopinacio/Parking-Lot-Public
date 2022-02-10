import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'default_page_controller.dart';

class DefaultPage extends GetView<DefaultPageController> {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() {
        return const Scaffold(
          body: Center(
            child: Text('Default Page'),
          ),
        );
      }),
    );
  }
}
