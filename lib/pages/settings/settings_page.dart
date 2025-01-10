import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../extensions/list_extensions.dart';
import '../../widgets/ec_section_line.dart';

/// CreateDate: 2025/1/9 16:25
/// Author: Lee
/// Description:

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFEDEDED),
        appBar: AppBar(
          backgroundColor: const Color(0xFFEDEDED),
          title: Text(
            'settings'.tr,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF101010),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ECSectionLine(title: 'account_security'.tr),
            _buildSettingsInfoLine02(),
            _buildSettingsInfoLine03(),
            _buildSettingsInfoLine04(),
            _buildSettingsInfoLine05(),
            _buildSettingsInfoLine06(),
            _buildSwitchAccountButton(),
            _buildLogoutButton(),
            const SizedBox(height: 40.0),
          ].mapWithSeparator(
            (e) => const SizedBox(height: 10.0),
          ),
        ),
      );

  Widget _buildSettingsInfoLine02() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ECSectionLine(title: 'parental_control_mode'.tr),
          ECSectionLine(title: 'easy_mode'.tr),
        ].mapWithSeparator(
          (e) => const Divider(
            height: .4,
            thickness: .4,
            color: Color(0xFFE7E7E7),
          ),
        ),
      );

  Widget _buildSettingsInfoLine03() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ECSectionLine(title: 'message_notifications'.tr),
          ECSectionLine(title: 'general'.tr),
        ].mapWithSeparator(
          (e) => const Divider(
            height: .4,
            thickness: .4,
            color: Color(0xFFE7E7E7),
          ),
        ),
      );

  Widget _buildSettingsInfoLine04() => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 4.0,
            ),
            child: Text(
              'privacy'.tr,
              style: const TextStyle(
                fontSize: 12.0,
                color: Color(0xFF606060),
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          ...[
            ECSectionLine(title: 'friends_permissions'.tr),
            ECSectionLine(title: 'my_information_and_authorizations'.tr),
            ECSectionLine(title: 'personal_information_collected'.tr),
            ECSectionLine(title: 'informatino_shared_with_third_paries'.tr),
          ].mapWithSeparator(
            (e) => const Divider(
              height: .4,
              thickness: .4,
              color: Color(0xFFE7E7E7),
            ),
          ),
        ],
      );

  Widget _buildSettingsInfoLine05() => ECSectionLine(
        title: 'plus'.tr,
        leading: const Icon(
          Icons.help_outline,
          size: 20.0,
          color: Color(0xFF828282),
        ),
        trailing: Text(
          'we_type_supports_ask_ai'.tr,
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xFF696969),
            fontWeight: FontWeight.w100,
          ),
        ),
      );

  Widget _buildSettingsInfoLine06() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ECSectionLine(title: 'help_and_feedback'.tr),
          ECSectionLine(
            title: 'about_weixin'.tr,
            trailing: Text(
              '${'version'.tr} 8.0.54',
              style: const TextStyle(
                fontSize: 14.0,
                color: Color(0xFF696969),
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ].mapWithSeparator(
          (e) => const Divider(
            height: .4,
            thickness: .4,
            color: Color(0xFFE7E7E7),
          ),
        ),
      );

  Widget _buildSwitchAccountButton() => TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'switch_account'.tr,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF020202),
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      );

  Widget _buildLogoutButton() => TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'log_out'.tr,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF020202),
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      );
}
