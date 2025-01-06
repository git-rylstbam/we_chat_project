import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'locales/locales.dart';
import 'pages/home/home_page.dart';
import 'theme.dart';

void main() => runApp(const _MyApp());

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'High Copy WeChat Project',
        debugShowCheckedModeBanner: false ,
        translations: Locales(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('zh', 'CN'),
        scrollBehavior: _MyScrollBehavior(),
        theme: lightTheme,
        home: const SafeArea(child: HomePage()),
      );
}

class _MyScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
