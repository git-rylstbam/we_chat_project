import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes.dart';
import '../../utils/icon_util.dart';

/// CreateDate: 2025/1/7 16:32
/// Author: Lee
/// Description:

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => Get.toNamed(RouteKey.home),
    );
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Image.asset(
            IconUtil.icon_003,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      );
}
