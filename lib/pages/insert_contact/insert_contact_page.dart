import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// CreateDate: 2025/1/9 15:57
/// Author: Lee
/// Description:

class InsertContactPage extends StatefulWidget {
  const InsertContactPage({super.key});

  @override
  State<InsertContactPage> createState() => _InsertContactPageState();
}

class _InsertContactPageState extends State<InsertContactPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFEDEDED),
        appBar: AppBar(
          title: Text('insert_contact'.tr),
        ),
      );
}
