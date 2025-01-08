import 'package:flutter/material.dart';

import '../model.dart';

/// CreateDate: 2025/1/8 10:16
/// Author: Lee
/// Description:

class LetterLine extends StatefulWidget {
  const LetterLine({super.key});

  @override
  State<LetterLine> createState() => _LetterLineState();
}

class _LetterLineState extends State<LetterLine> {
  String _selectLetter = '';

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: letters
            .map(
              (e) => GestureDetector(
                onTap: () => setState(() => _selectLetter = e),
                child: Text(
                  e,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: _selectLetter == e ? Colors.green : Colors.black,
                  ),
                ),
              ),
            )
            .toList(),
      );
}
