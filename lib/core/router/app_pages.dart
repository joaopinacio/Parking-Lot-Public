import 'package:parking_lot/pages/historic/historic_page.dart';
import 'package:parking_lot/pages/historic/historic_page_bindings.dart';
import 'package:parking_lot/pages/home/home_page.dart';
import 'package:parking_lot/pages/home/home_page_bindings.dart';
import 'package:parking_lot/pages/splash/splash_page.dart';
import 'package:parking_lot/pages/splash/splash_page_bindings.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
  AppPages._();

  static final AppPages instance = AppPages._();

  final splash = '/splash';
  final home = '/home';
  final historic = '/historic';

  get splashPage => GetPage(
        name: splash,
        page: () => const SplashPage(),
        binding: SplashPageBindings(),
        transition: Transition.fadeIn,
      );

  get homePage => GetPage(
        name: home,
        page: () => const HomePage(),
        binding: HomePageBindings(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      );

  get historicPage => GetPage(
        name: historic,
        page: () => const HistoricPage(),
        binding: HistoricPageBindings(),
        transition: Transition.cupertino,
      );

  List<GetPage<dynamic>>? get getPagesList => [
        splashPage,
        homePage,
        historicPage,
      ];
}
