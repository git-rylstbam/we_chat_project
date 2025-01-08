import 'package:flutter/material.dart';

/// CreateDate: 2025/1/8 10:14
/// Author: Lee
/// Description:

class ContactHeaderDelegate extends SliverPersistentHeaderDelegate {
  const ContactHeaderDelegate(this.tag);

  final String? tag;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) =>
      Container(
        height: 40.0,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 10.0),
        color: Colors.white,
        child: Text(tag ?? '--'),
      );

  @override
  double get maxExtent => minExtent;

  @override
  double get minExtent => 40.0;

  @override
  bool shouldRebuild(ContactHeaderDelegate oldDelegate) =>
      tag != oldDelegate.tag;
}
