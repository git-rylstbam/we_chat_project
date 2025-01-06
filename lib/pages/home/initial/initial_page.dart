import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// CreateDate: 2025/1/6 9:22
/// Author: Lee
/// Description:

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFEDEDED),
          title: Text(
            'weixin'.tr,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF1B1B1B),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: List.generate(
            100,
            (index) => ListTile(title: Center(child: Text('$index'))),
          ),
        ),
      );
}
