import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../extensions/list_extensions.dart';
import '../../routes.dart';
import '../home/contact/model.dart';

/// CreateDate: 2025/1/8 15:04
/// Author: Lee
/// Description:

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final List<ContactInfo> contacts;

  final _infoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    contacts = Get.arguments ?? [];
  }

  @override
  void dispose() {
    super.dispose();
    _infoController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFEDEDED),
        appBar: AppBar(
          backgroundColor: const Color(0xFFEDEDED),
          title: Text(
            '${'group_chat'.tr} (${contacts.length})',
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF181818),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => Get.toNamed(
                Routes.chat_info,
                arguments: contacts,
              ),
              icon: const Icon(Icons.more_horiz),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10.0),
                physics: const BouncingScrollPhysics(),
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '${DateTime.now().hour}:${DateTime.now().minute}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFFA5A5A5),
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      contacts.map((e) => e.name).toList().join(','),
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFFA5A5A5),
                        fontWeight: FontWeight.w100,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ].mapWithSeparator(
                  (e) => const SizedBox(height: 10.0),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 4.0,
              ),
              color: const Color(0xFFF6F6F6),
              child: Row(
                spacing: 10.0,
                children: [
                  const Icon(Icons.eco, size: 20.0, color: Color(0xFF191919)),
                  Expanded(
                    child: TextField(
                      controller: _infoController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 8.0,
                        ),
                      ),
                      cursorHeight: 14.0,
                      cursorWidth: 1.0,
                      cursorColor: const Color(0xFF191919),
                    ),
                  ),
                  const Icon(
                    Icons.emoji_emotions_outlined,
                    size: 20.0,
                    color: Color(0xFF191919),
                  ),
                  const Icon(
                    Icons.add_circle_outline,
                    size: 20.0,
                    color: Color(0xFF191919),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
