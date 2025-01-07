import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinyin/pinyin.dart';

import 'model.dart';

/// CreateDate: 2025/1/6 9:22
/// Author: Lee
/// Description:

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with AutomaticKeepAliveClientMixin {
  late final List<ContactEntity> _sortedContacts;

  final _scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _sortedContacts = contacts.toList()..sort();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEDEDED),
        title: Text(
          'contacts'.tr,
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
            icon: const Icon(Icons.person_add_alt_1),
          ),
        ],
      ),
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildSearchLine(),
              _buildOperationLine(),
              ..._sortedContacts.map(_buildContactItem),
            ],
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: _LetterLine(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchLine() => SliverToBoxAdapter(
        child: Container(
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
        ),
      );

  Widget _buildOperationLine() => SliverToBoxAdapter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...operations.map(
              (e) => _ContactOperationLine(
                operation: e,
                onPressed: (value) {},
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      );

  Widget _buildContactItem(ContactEntity e) {
    final infos = e.list!.toList()
      ..sort(
        (a, b) {
          final pinyinA = PinyinHelper.getPinyin(a.name!);
          final pinyinB = PinyinHelper.getPinyin(b.name!);
          return pinyinA.compareTo(pinyinB);
        },
      );
    return SliverMainAxisGroup(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _ContactHeaderDelegate(e.tag),
        ),
        SliverList.separated(
          itemBuilder: (_, index) => _buildContactInfo(infos[index]),
          separatorBuilder: (_, __) => const Divider(
            height: .4,
            thickness: .4,
            color: Color(0xFFE7E7E7),
          ),
          itemCount: infos.length,
        ),
      ],
    );
  }

  Widget _buildContactInfo(ContactInfo? info) => GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Row(
            spacing: 10.0,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: info?.icon == null
                    ? const Placeholder()
                    : Image.asset(
                        info!.icon!,
                        width: 35.0,
                        height: 35.0,
                        fit: BoxFit.fill,
                      ),
              ),
              Expanded(
                child: Text(
                  info?.name ?? '--',
                  style: const TextStyle(fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
      );
}

class _ContactHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _ContactHeaderDelegate(this.tag);

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
  bool shouldRebuild(_ContactHeaderDelegate oldDelegate) =>
      tag != oldDelegate.tag;
}

class _ContactOperationLine extends StatelessWidget {
  const _ContactOperationLine({
    required this.operation,
    required this.onPressed,
  });

  final ContactOperationEntity operation;
  final void Function(ContactOperationEntity operation) onPressed;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => onPressed(operation),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                spacing: 10.0,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      color: operation.color,
                    ),
                    child: Icon(operation.icon, color: Colors.white),
                  ),
                  Text(operation.title?.tr ?? '--'),
                ],
              ),
            ),
            const Divider(height: .4, thickness: .4, color: Color(0xFFE7E7E7)),
          ],
        ),
      );
}

class _LetterLine extends StatefulWidget {
  const _LetterLine();

  @override
  State<_LetterLine> createState() => _LetterLineState();
}

class _LetterLineState extends State<_LetterLine> {
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
