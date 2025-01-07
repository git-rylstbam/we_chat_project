import 'package:get/get.dart';

import 'pages/home/home_page.dart';
import 'pages/splash/splash_page.dart';

/// CreateDate: 2025/1/7 16:36
/// Author: Lee
/// Description:

abstract class RouteKey {
  static const splash = '/';
  static const home = '/home';
}

abstract class Routes {
  static final routes = [
    GetPage(name: RouteKey.splash, page: () => const SplashPage()),
    GetPage(name: RouteKey.home, page: () => const HomePage()),
  ];
}
