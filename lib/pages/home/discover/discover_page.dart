import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../extensions/list_extensions.dart';
import '../../../locales/locales.dart';
import '../../../widgets/ec_section_line.dart';

/// CreateDate: 2025/1/6 9:23
/// Author: Lee
/// Description:

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFEDEDED),
        appBar: AppBar(
          backgroundColor: const Color(0xFFEDEDED),
          title: Text(
            'discover'.tr,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF1B1B1B),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ECSectionLine(
              icon: Icons.linked_camera,
              title: 'moments'.tr,
              color: Colors.red,
              onPressed: () {},
            ),
            _buildDiscoverSectionLine01(),
            _buildDiscoverSectionLine02(),
            _buildDiscoverSectionLine03(),
            ECSectionLine(
              icon: Icons.school,
              title: 'nearby'.tr,
              color: Colors.red,
              onPressed: () {},
            ),
            if (Get.locale == Locales.en)
              ECSectionLine(
                icon: Icons.sensors,
                title: 'games'.tr,
                color: Colors.orange,
                onPressed: () {},
              )
            else
              _buildDiscoverSectionLine04(),
            ECSectionLine(
              icon: Icons.spa,
              title: 'mini_programs'.tr,
              color: Colors.yellow,
              onPressed: () {},
            ),
          ].mapWithSeparator(
            (e) => const SizedBox(height: 10.0),
          ),
        ),
      );

  Widget _buildDiscoverSectionLine01() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ECSectionLine(
            icon: Icons.kitesurfing,
            title: 'channels'.tr,
            color: Colors.orange,
            onPressed: () {},
          ),
          ECSectionLine(
            icon: Icons.motion_photos_auto,
            title: 'live'.tr,
            color: Colors.yellow,
            onPressed: () {},
          ),
        ].mapWithSeparator(
          (e) => const Divider(
            height: .4,
            thickness: .4,
            color: Color(0xFFE7E7E7),
          ),
        ),
      );

  Widget _buildDiscoverSectionLine02() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ECSectionLine(
            icon: Icons.opacity,
            title: 'scan'.tr,
            color: Colors.green,
            onPressed: () {},
          ),
          ECSectionLine(
            icon: Icons.pets,
            title: 'listen'.tr,
            color: Colors.teal,
            onPressed: () {},
          ),
        ].mapWithSeparator(
          (e) => const Divider(
            height: .4,
            thickness: .4,
            color: Color(0xFFE7E7E7),
          ),
        ),
      );

  Widget _buildDiscoverSectionLine03() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ECSectionLine(
            icon: Icons.radio_button_checked,
            title: 'top_stories'.tr,
            color: Colors.purple,
            onPressed: () {},
          ),
          ECSectionLine(
            icon: Icons.restaurant,
            title: 'search'.tr,
            color: Colors.pink,
            onPressed: () {},
          ),
        ].mapWithSeparator(
          (e) => const Divider(
            height: .4,
            thickness: .4,
            color: Color(0xFFE7E7E7),
          ),
        ),
      );

  Widget _buildDiscoverSectionLine04() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ECSectionLine(
            icon: Icons.sports_volleyball,
            title: 'shopping'.tr,
            color: Colors.green,
            onPressed: () {},
          ),
          ECSectionLine(
            icon: Icons.sensors,
            title: 'games'.tr,
            color: Colors.orange,
            onPressed: () {},
          ),
        ].mapWithSeparator(
          (e) => const Divider(
            height: .4,
            thickness: .4,
            color: Color(0xFFE7E7E7),
          ),
        ),
      );
}
