import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../extensions/list_extensions.dart';
import '../../widgets/ec_section_line.dart';
import '../home/contact/model.dart';
import 'widgets/operate_contact_painter.dart';

/// CreateDate: 2025/1/8 16:10
/// Author: Lee
/// Description:

class ChatInfoPage extends StatefulWidget {
  const ChatInfoPage({super.key});

  @override
  State<ChatInfoPage> createState() => _ChatInfoPageState();
}

class _ChatInfoPageState extends State<ChatInfoPage> {
  late final List<ContactInfo> contacts;

  final _muteNotificationNotifier = ValueNotifier<bool>(false);
  final _stickyOnTopNotifier = ValueNotifier<bool>(false);
  final _saveToContactsNotifier = ValueNotifier<bool>(true);
  final _onScreenNamesNotifier = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    contacts = Get.arguments ?? [];
  }

  @override
  void dispose() {
    _muteNotificationNotifier.dispose();
    _stickyOnTopNotifier.dispose();
    _saveToContactsNotifier.dispose();
    _onScreenNamesNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFEDEDED),
        appBar: AppBar(
          title: Text(
            '${'group'.tr} (${contacts.length})',
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF1A1A1A),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            _ContactListLine(contacts: contacts),
            _buildChatInfoLine01(),
            ECSectionLine(title: 'search_chat_history'.tr, onPressed: () {}),
            _buildChatInfoLine03(),
            _buildChatInfoLine04(),
            ECSectionLine(title: 'background'.tr, onPressed: () {}),
            ECSectionLine(
              title: 'clear_chat_history'.tr,
              onPressed: () {},
              showArrow: false,
            ),
            ECSectionLine(title: 'report'.tr, onPressed: () {}),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'leave'.tr,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFFF84F54),
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40.0),
          ].mapWithSeparator(
            (e) => const SizedBox(height: 10.0),
          ),
        ),
      );

  Widget _buildChatInfoLine01() => Column(
        children: [
          _buildGroupNameLine(),
          _buildGroupQrcodeLine(),
          _buildGroupNoticeLine(),
          ECSectionLine(title: 'manage_group'.tr, onPressed: () {}),
          ECSectionLine(title: 'remark'.tr, onPressed: () {}),
        ].mapWithSeparator(
          (e) => const Divider(
            height: .4,
            thickness: .4,
            color: Color(0xFFE7E7E7),
          ),
        ),
      );

  Widget _buildGroupNameLine() => ECSectionLine(
        title: 'group_name'.tr,
        onPressed: () {},
        trailing: Text(
          'not_named'.tr,
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xFF737373),
            fontWeight: FontWeight.w100,
          ),
        ),
      );

  Widget _buildGroupQrcodeLine() => ECSectionLine(
        title: 'group_qrcode'.tr,
        onPressed: () {},
        trailing: const Icon(
          Icons.qr_code,
          size: 20.0,
          color: Color(0xFF737373),
        ),
      );

  Widget _buildGroupNoticeLine() => ECSectionLine(
        title: 'group_notice'.tr,
        onPressed: () {},
        trailing: Text(
          'not_set'.tr,
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xFF737373),
            fontWeight: FontWeight.w100,
          ),
        ),
      );

  Widget _buildChatInfoLine03() => Column(
        children: [
          _buildMuteNotificationsLine(),
          _buildStickyOnTopLine(),
          _buildSaveToContactsLine(),
        ].mapWithSeparator(
          (e) => const Divider(
            height: .4,
            thickness: .4,
            color: Color(0xFFE7E7E7),
          ),
        ),
      );

  Widget _buildMuteNotificationsLine() => ECSectionLine(
        title: 'mute_notifications'.tr,
        trailing: ValueListenableBuilder(
          valueListenable: _muteNotificationNotifier,
          builder: (_, value, __) => SizedBox(
            height: 14.0,
            child: CupertinoSwitch(
              value: value,
              onChanged: (value) => _muteNotificationNotifier.value = value,
            ),
          ),
        ),
        showArrow: false,
      );

  Widget _buildStickyOnTopLine() => ECSectionLine(
        title: 'sticky_on_top'.tr,
        trailing: ValueListenableBuilder(
          valueListenable: _stickyOnTopNotifier,
          builder: (_, value, __) => SizedBox(
            height: 14.0,
            child: CupertinoSwitch(
              value: value,
              onChanged: (value) => _stickyOnTopNotifier.value = value,
            ),
          ),
        ),
        showArrow: false,
      );

  Widget _buildSaveToContactsLine() => ECSectionLine(
        title: 'save_to_contacts'.tr,
        trailing: ValueListenableBuilder(
          valueListenable: _saveToContactsNotifier,
          builder: (_, value, __) => SizedBox(
            height: 14.0,
            child: CupertinoSwitch(
              value: value,
              onChanged: (value) => _saveToContactsNotifier.value = value,
            ),
          ),
        ),
        showArrow: false,
      );

  Widget _buildChatInfoLine04() => Column(
        children: [
          _buildMyAliasInGroupLine(),
          _buildOnScreenNamesLine(),
        ].mapWithSeparator(
          (e) => const Divider(
            height: .4,
            thickness: .4,
            color: Color(0xFFE7E7E7),
          ),
        ),
      );

  Widget _buildMyAliasInGroupLine() => ECSectionLine(
        title: 'my_alias_in_group'.tr,
        trailing: const Text(
          '花果山来的猴子',
          style: TextStyle(
            fontSize: 14.0,
            color: Color(0xFF737373),
            fontWeight: FontWeight.w100,
          ),
        ),
      );

  Widget _buildOnScreenNamesLine() => ECSectionLine(
        title: 'on_screen_names'.tr,
        trailing: ValueListenableBuilder(
          valueListenable: _onScreenNamesNotifier,
          builder: (_, value, __) => SizedBox(
            height: 14.0,
            child: CupertinoSwitch(
              value: value,
              onChanged: (value) => _onScreenNamesNotifier.value = value,
            ),
          ),
        ),
        showArrow: false,
      );
}

class _ContactListLine extends StatefulWidget {
  const _ContactListLine({required this.contacts});

  final List<ContactInfo> contacts;

  @override
  State<_ContactListLine> createState() => _ContactListLineState();
}

class _ContactListLineState extends State<_ContactListLine> {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Wrap(
          spacing: 20.0,
          runSpacing: 20.0,
          children: [
            ...widget.contacts.map(_buildContactInfoItem),
            _buildOperateButton(InsertContactPainter()),
            _buildOperateButton(MinusContactPainter()),
          ],
        ),
      );

  Widget _buildContactInfoItem(ContactInfo contact) => Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 4.0,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            child: contact.icon == null
                ? const Placeholder()
                : Image.asset(
                    contact.icon!,
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.fill,
                  ),
          ),
          Text(
            contact.name ?? '--',
            style: const TextStyle(
              fontSize: 12.0,
              color: Color(0xFF787878),
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      );

  Widget _buildOperateButton(CustomPainter painter) => GestureDetector(
        onTap: () {},
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: const Color(0xFFB2B2B2),
          radius: const Radius.circular(4.0),
          strokeWidth: .5,
          dashPattern: const [4, 4],
          padding: const EdgeInsets.all(10.0),
          child: CustomPaint(
            painter: painter,
            size: const Size.square(20.0),
          ),
        ),
      );
}

enum OperateTypeEnum { insert, minus }
