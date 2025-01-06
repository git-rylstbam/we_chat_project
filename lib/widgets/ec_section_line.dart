import 'package:flutter/material.dart';

/// CreateDate: 2025/1/6 14:59
/// Author: Lee
/// Description:

class ECSectionLine extends StatelessWidget {
  const ECSectionLine({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onPressed,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final Color color;
  final void Function() onPressed;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
          child: Row(
            spacing: 10.0,
            children: [
              Icon(icon, color: color, size: 18.0),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (trailing != null) trailing!,
              const ECRightArrow(),
            ],
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
