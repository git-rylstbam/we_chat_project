import 'package:get/get.dart';

import 'pages/chat/chat_page.dart';
import 'pages/chat_info/chat_info_page.dart';
import 'pages/home/home_page.dart';
import 'pages/splash/splash_page.dart';

/// CreateDate: 2025/1/7 16:36
/// Author: Lee
/// Description:

abstract class Routes {
  static const splash = '/';
  static const home = '/home';
  static const chat = '/chat';
  static const chat_info = '/chat_info';

  static final routes = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: chat, page: () => const ChatPage()),
    GetPage(name: chat_info, page: () => const ChatInfoPage()),
  ];
}
