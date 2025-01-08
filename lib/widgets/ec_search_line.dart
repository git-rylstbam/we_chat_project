import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// CreateDate: 2025/1/7 16:05
/// Author: Lee
/// Description:

class ECSearechLine extends StatelessWidget {
  const ECSearechLine({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        color: const Color(0xFFEDEDED),
        child: TextButton.icon(
          onPressed: () {},
          label: Text(
            'search'.tr,
            style: const TextStyle(fontSize: 14.0, color: Color(0xFFB2B2B2)),
          ),
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            backgroundColor: Colors.white,
            overlayColor: Colors.transparent,
          ),
          icon: const Icon(
            Icons.search,
            color: Color(0xFFB2B2B2),
          ),
        ),
      );
}
