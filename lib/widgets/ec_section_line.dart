import 'package:flutter/material.dart';

/// CreateDate: 2025/1/6 14:59
/// Author: Lee
/// Description:

class ECSectionLine extends StatelessWidget {
  const ECSectionLine({
    super.key,
    this.icon,
    required this.title,
    this.color,
    this.path,
    this.onPressed,
    this.leading,
    this.trailing,
    this.fontWeight = FontWeight.w100,
    this.showArrow = true,
    this.iconSize = 18.0,
    this.imageWidth = 18.0,
    this.imageHeight = 18.0,
  });

  final IconData? icon;
  final String title;
  final Color? color;
  final String? path;
  final void Function()? onPressed;
  final Widget? leading;
  final Widget? trailing;
  final FontWeight fontWeight;
  final bool showArrow;
  final double iconSize;
  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20.0),
            child: Row(
              spacing: 10.0,
              children: [
                if (icon != null) Icon(icon, color: color, size: iconSize),
                if (path != null)
                  Image.asset(
                    path!,
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.fill,
                  ),
                Expanded(
                  child: Row(
                    spacing: 10.0,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: fontWeight,
                        ),
                      ),
                      if (leading != null) leading!,
                    ],
                  ),
                ),
                if (trailing != null) trailing!,
                if (showArrow) const ECRightArrow(),
              ],
            ),
          ),
        ),
      );
}

class ECRightArrow extends StatelessWidget {
  const ECRightArrow({super.key});

  @override
  Widget build(BuildContext context) => const Icon(
        Icons.keyboard_arrow_right,
        size: 18.0,
        color: Color(0xFFB3B3B3),
      );
}
