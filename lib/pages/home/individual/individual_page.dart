import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../extensions/list_extensions.dart';
import '../../../routes.dart';
import '../../../utils/icon_util.dart';
import '../../../widgets/ec_section_line.dart';

/// CreateDate: 2025/1/6 9:23
/// Author: Lee
/// Description:

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFEDEDED),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const _IndividualHeader(),
              ECSectionLine(
                icon: Icons.sports_baseball,
                title: 'pay_and_services'.tr,
                color: const Color(0xFF1DC879),
                onPressed: () {},
              ),
              const _IndividualSectionList(),
              ECSectionLine(
                icon: Icons.settings_outlined,
                title: 'settings'.tr,
                color: Colors.pink,
                onPressed: () => Get.toNamed(Routes.settings),
              ),
            ].mapWithSeparator(
              (e) => const SizedBox(height: 10.0),
            ),
          ),
        ),
      );
}

class _IndividualHeader extends StatelessWidget {
  const _IndividualHeader();

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {},
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.only(
            left: 30.0,
            top: 40.0,
            right: 20.0,
            bottom: 40.0,
          ),
          child: Row(
            spacing: 20.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIndividualAvatar(),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 10.0,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildUsername(),
                          _buildUserID(),
                          Row(
                            spacing: 10.0,
                            children: [
                              _buildAddStatusButton(),
                              _buildPublishStatusButton(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.qr_code,
                      size: 18.0,
                      color: Color(0xFF757575),
                    ),
                    const ECRightArrow(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildIndividualAvatar() => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Image.asset(
          IconUtil.icon_001,
          width: 60.0,
          height: 60.0,
          fit: BoxFit.fill,
        ),
      );

  Widget _buildUsername() => const Text(
        '林落凝',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _buildUserID() => Text(
        '${'weixin_id'.tr} : linluoning',
        style: const TextStyle(
          fontSize: 14.0,
          color: Color(0xFF757575),
          fontWeight: FontWeight.w100,
        ),
      );

  Widget _buildAddStatusButton() => GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            border: Border.all(color: const Color(0xFFDDDDDD), width: .4),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Row(
            spacing: 4.0,
            children: [
              const Icon(Icons.add, size: 12.0, color: Color(0xFF757575)),
              Text(
                'status'.tr,
                style:
                    const TextStyle(fontSize: 12.0, color: Color(0xFF757575)),
              ),
            ],
          ),
        ),
      );

  Widget _buildPublishStatusButton() => GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            border: Border.all(color: const Color(0xFFDDDDDD), width: .4),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(5.0),
          child: const Icon(
            Icons.edit,
            size: 14.0,
            color: Color(0xFF757575),
          ),
        ),
      );
}

class _IndividualSectionList extends StatelessWidget {
  const _IndividualSectionList();

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ECSectionLine(
            icon: Icons.sports_basketball,
            title: 'favorites'.tr,
            color: Colors.red,
            onPressed: () {},
          ),
          ECSectionLine(
            icon: Icons.sports_soccer,
            title: 'moments'.tr,
            color: Colors.orange,
            onPressed: () {},
          ),
          ECSectionLine(
            icon: Icons.credit_card,
            title: 'cards_and_offers'.tr,
            color: Colors.blue,
            onPressed: () {},
          ),
          ECSectionLine(
            icon: Icons.tag_faces,
            title: 'sticker_gallery'.tr,
            color: Colors.purple,
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
