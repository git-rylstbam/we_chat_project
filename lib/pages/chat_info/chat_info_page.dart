import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../extensions/list_extensions.dart';
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

  @override
  void initState() {
    super.initState();
    contacts = Get.arguments ?? [];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
          ].mapWithSeparator(
            (e) => const Divider(
              height: 10.0,
              thickness: 10.0,
              color: Color(0xFFEDEDED),
            ),
          ),
        ),
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
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Wrap(
          spacing: 20.0,
          runSpacing: 20.0,
          children: [
            ...widget.contacts.map(_buildContactInfoItem),
            _buildOperateButton(OperateTypeEnum.insert),
            _buildOperateButton(OperateTypeEnum.minus),
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

  Widget _buildOperateButton(OperateTypeEnum type) => GestureDetector(
        onTap: () {},
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: const Color(0xFFB2B2B2),
          radius: const Radius.circular(4.0),
          strokeWidth: .5,
          dashPattern: const [4, 4],
          padding: const EdgeInsets.all(10.0),
          child: CustomPaint(
            painter: type == OperateTypeEnum.insert
                ? InsertContactPainter()
                : MinusContactPainter(),
            size: const Size.square(20.0),
          ),
        ),
      );
}

enum OperateTypeEnum { insert, minus }
