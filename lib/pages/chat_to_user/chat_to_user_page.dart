import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/initial/model.dart';

/// CreateDate: 2025/1/10 9:23
/// Author: Lee
/// Description:

class ChatToUserPage extends StatefulWidget {
  const ChatToUserPage({super.key, required this.count});

  final int count;

  @override
  State<ChatToUserPage> createState() => _ChatToUserPageState();
}

class _ChatToUserPageState extends State<ChatToUserPage> {
  late final UserEntity _user;

  @override
  void initState() {
    super.initState();
    _user = Get.arguments ?? users[0];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFEDEDED),
        appBar: AppBar(
          backgroundColor: const Color(0xFFEDEDED),
          automaticallyImplyLeading: false,
          leadingWidth: 58.0,
          leading: _buildAppBarLeading(),
          title: Text(
            _user.name ?? '--',
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF181818),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
            ),
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
        ),
      );

  Widget _buildAppBarLeading() => Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: Get.back,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.keyboard_arrow_left,
                  size: 24.0,
                  color: Color(0xFF181818),
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD5D5D5),
                  ),
                  padding: const EdgeInsets.all(4.0),
                  child: widget.count <= 99
                      ? Text(
                          widget.count.toString(),
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF151515),
                            fontWeight: FontWeight.w100,
                          ),
                        )
                      : const Icon(
                          Icons.more_horiz,
                          size: 12.0,
                          color: Color(0xFF151515),
                        ),
                ),
              ],
            ),
          ),
        ),
      );
}
