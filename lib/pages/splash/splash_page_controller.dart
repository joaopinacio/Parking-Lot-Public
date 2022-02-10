import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_lot/core/router/app_pages.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';

class SplashPageController extends GetxController {
  final AppPages _appPages;

  BuildContext? switcherContext;

  SplashPageController({
    required AppPages appPages,
  }) : _appPages = appPages {
    init();
  }

  void init() async {
    await Future.delayed(const Duration(seconds: 1));
    ThemeSwitcher.of(switcherContext!).changeTheme(
      theme: ThemeData(
        fontFamily: 'ZonaPro',
        primaryColor: AppThemes.colors.secondaryBlack,
        scaffoldBackgroundColor: AppThemes.colors.primaryColor,
        primaryColorLight: AppThemes.colors.secondaryBlack,
        primaryIconTheme: IconThemeData(
          color: AppThemes.colors.white,
        ),
        colorScheme: ColorScheme.light(
          primary: AppThemes.colors.secondaryBlack,
          onSecondary: AppThemes.colors.white,
        ),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 1500));
    Get.offNamed(_appPages.home);
  }
}
