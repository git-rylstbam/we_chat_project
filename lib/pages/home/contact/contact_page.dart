import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinyin/pinyin.dart';

import '../../../widgets/ec_search_line.dart';
import 'model.dart';
import 'widgets/contact_header_delegate.dart';
import 'widgets/contact_info_line.dart';
import 'widgets/letter_line.dart';

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
        automaticallyImplyLeading: false,
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
              SliverToBoxAdapter(child: ECSearechLine(onPressed: () {})),
              _buildOperationLine(),
              ..._sortedContacts.map(_buildContactItem),
            ],
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: LetterLine(),
            ),
          ),
        ],
      ),
    );
  }

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
          delegate: ContactHeaderDelegate(e.tag),
        ),
        SliverList.separated(
          itemBuilder: (_, index) => ContactInfoLine(info: infos[index]),
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
