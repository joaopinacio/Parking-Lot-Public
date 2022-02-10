import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:parking_lot/core/router/app_pages.dart';
import 'package:parking_lot/main_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_lot/core/lang/translation_service.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Get.changeTheme(ThemeData.light());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var translationService = TranslationService();
    var initTheme = ThemeData(
      fontFamily: 'ZonaPro',
      primaryColor: AppThemes.colors.secondaryBlack,
      scaffoldBackgroundColor: AppThemes.colors.secondaryBlack,
      primaryColorLight: AppThemes.colors.white,
      primaryIconTheme: IconThemeData(
        color: AppThemes.colors.white,
      ),
      colorScheme: ColorScheme.light(
        primary: AppThemes.colors.secondaryBlack,
        onSecondary: AppThemes.colors.white,
      ),
    );

    return ThemeProvider(
      initTheme: initTheme,
      duration: const Duration(milliseconds: 1000),
      builder: (context, myTheme) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          splitScreenMode: true,
          minTextAdapt: true,
          builder: () => GetMaterialApp(
            builder: (context, widget) {
              ScreenUtil.setContext(context);
              return MediaQuery(
                data: MediaQuery.of(context),
                child: widget!,
              );
            },
            debugShowCheckedModeBanner: false,
            enableLog: true,
            locale: TranslationService.locale,
            fallbackLocale: TranslationService.fallbackLocale,
            translations: translationService,
            getPages: AppPages.instance.getPagesList,
            initialRoute: AppPages.instance.splash,
            initialBinding: MainBindings(),
            theme: myTheme,
          ),
        );
      },
    );
  }
}
