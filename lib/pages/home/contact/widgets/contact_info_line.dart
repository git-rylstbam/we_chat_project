import 'package:flutter/material.dart';

import '../model.dart';

/// CreateDate: 2025/1/8 10:15
/// Author: Lee
/// Description:

class ContactInfoLine extends StatefulWidget {
  const ContactInfoLine({
    super.key,
    this.info,
    this.canChoose = false,
    this.onChecked,
  });

  final ContactInfo? info;
  final bool canChoose;
  final void Function(bool value, ContactInfo? info)? onChecked;

  @override
  State<ContactInfoLine> createState() => _ContactInfoLineState();
}

class _ContactInfoLineState extends State<ContactInfoLine>
    with AutomaticKeepAliveClientMixin {
  bool _isChecked = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Row(
          spacing: 10.0,
          children: [
            if (widget.canChoose)
              Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(
                    () => _isChecked = value ?? false,
                  );
                  if (widget.onChecked == null) return;
                  widget.onChecked!(_isChecked, widget.info);
                },
                shape: const StadiumBorder(),
                activeColor: const Color(0xFF1FC265),
                checkColor: Colors.white,
                hoverColor: Colors.transparent,
                splashRadius: .0,
                side: const BorderSide(color: Color(0xFFB4B4B4)),
              ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: widget.info?.icon == null
                  ? const Placeholder()
                  : Image.asset(
                      widget.info!.icon!,
                      width: 35.0,
                      height: 35.0,
                      fit: BoxFit.fill,
                    ),
            ),
            Expanded(
              child: Text(
                widget.info?.name ?? '--',
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
