import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../extensions/list_extensions.dart';
import '../model.dart';
import 'start_group_chat_dialog.dart';

/// CreateDate: 2025/1/7 17:20
/// Author: Lee
/// Description:

class OperateButton extends StatefulWidget {
  const OperateButton({super.key});

  @override
  State<OperateButton> createState() => _OperateButtonState();
}

class _OperateButtonState extends State<OperateButton> {
  final _key = GlobalKey();

  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    _overlayEntry = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => IconButton(
        key: _key,
        onPressed: _showOperations,
        icon: const Icon(Icons.add_circle_outline),
      );

  void _showOperations() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    final render = (_key.currentContext?.findRenderObject())! as RenderBox;
    final size = render.size;
    final position = render.localToGlobal(Offset.zero);
    return OverlayEntry(
      builder: (_) => Positioned(
        right: 10.0,
        top: position.dy + size.height + 1.0,
        child: TapRegion(
          onTapOutside: (_) {
            _overlayEntry?.remove();
            _overlayEntry?.dispose();
            _overlayEntry = null;
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CustomPaint(
                  painter: _TriangleHeaderPainter(),
                  size: const Size(10.0, 5.0),
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  color: Color(0xFF4C4C4C),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: operations
                      .map(_buildOperationItem)
                      .toList()
                      .mapWithSeparator(
                        (e) => const Divider(
                          height: .5,
                          thickness: .5,
                          color: Colors.white,
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOperationItem(OperationEntity operation) => GestureDetector(
        onTap: () {
          switch (operation.id) {
            case 0:
              showDialog(
                context: context,
                builder: (_) => const StartGroupChatDialog(),
              );
          }
          _overlayEntry?.remove();
          _overlayEntry?.dispose();
          _overlayEntry = null;
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            spacing: 10.0,
            children: [
              Icon(operation.icon, size: 20.0, color: Colors.white),
              Text(
                operation.title?.tr ?? '--',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
        ),
      );
}

class _TriangleHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width / 2, .0)
      ..lineTo(.0, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(
      path,
      Paint()
        ..color = const Color(0xFF4C4C4C)
        ..isAntiAlias = true
        ..style = PaintingStyle.fill
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_TriangleHeaderPainter oldDelegate) => false;
}
