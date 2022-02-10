import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';

import 'splash_page_controller.dart';

class SplashPage extends GetView<SplashPageController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ThemeSwitchingArea(
        child: Scaffold(
          body: Center(
            child: Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  color: AppThemes.colors.white,
                  width: 6.sp,
                ),
              ),
              child: Center(
                child: ThemeSwitcher(
                  clipper: const ThemeSwitcherCircleClipper(),
                  builder: (BuildContext context) {
                    controller.switcherContext = context;
                    return Text(
                      'P',
                      style: AppThemes.typography.zonaProExtraBold_40.copyWith(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
