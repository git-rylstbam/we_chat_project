import 'package:flutter/material.dart';

/// CreateDate: 2025/1/8 16:35
/// Author: Lee
/// Description:

class InsertContactPainter extends CustomPainter {
  final _paint = Paint()
    ..color = const Color(0xFFB2B2B2)
    ..strokeWidth = .5
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.drawLine(
      Offset(-size.width / 2, .0),
      Offset(size.width / 2, .0),
      _paint,
    );
    canvas.drawLine(
      Offset(.0, -size.height / 2),
      Offset(.0, size.height / 2),
      _paint,
    );
  }

  @override
  bool shouldRepaint(InsertContactPainter oldDelegate) => false;
}

class MinusContactPainter extends CustomPainter {
  final _paint = Paint()
    ..color = const Color(0xFFB2B2B2)
    ..strokeWidth = .5
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.drawLine(
      Offset(-size.width / 2, .0),
      Offset(size.width / 2, .0),
      _paint,
    );
  }

  @override
  bool shouldRepaint(MinusContactPainter oldDelegate) => false;
}
