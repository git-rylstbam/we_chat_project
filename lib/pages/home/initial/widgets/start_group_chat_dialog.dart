import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinyin/pinyin.dart';

import '../../../../extensions/list_extensions.dart';
import '../../../../routes.dart';
import '../../../../widgets/ec_search_line.dart';
import '../../../../widgets/ec_section_line.dart';
import '../../contact/model.dart';
import '../../contact/widgets/contact_header_delegate.dart';
import '../../contact/widgets/contact_info_line.dart';
import '../../contact/widgets/letter_line.dart';

/// CreateDate: 2025/1/8 9:14
/// Author: Lee
/// Description:

class StartGroupChatDialog extends StatefulWidget {
  const StartGroupChatDialog({super.key});

  @override
  State<StartGroupChatDialog> createState() => _StartGroupChatDialogState();
}

class _StartGroupChatDialogState extends State<StartGroupChatDialog> {
  late final List<ContactEntity> _sortedContacts;

  final _contactListNotifier = _ContactListNotifier();

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _sortedContacts = contacts.toList()..sort();
  }

  @override
  void dispose() {
    super.dispose();
    _contactListNotifier.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFEDEDED),
          leading: TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(overlayColor: Colors.transparent),
            child: Text(
              'cancel'.tr,
              style: const TextStyle(fontSize: 14.0, color: Color(0xFF181818)),
            ),
          ),
          title: Text(
            'friends'.tr,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF181818),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ValueListenableBuilder(
                valueListenable: _contactListNotifier,
                builder: (_, value, __) => ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Get.toNamed(Routes.chat, arguments: value);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: value.isEmpty
                        ? const Color(0xFFE1E1E1)
                        : const Color(0xFF1FC265),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    overlayColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: .0,
                  ),
                  child: Text(
                    value.isEmpty ? 'done'.tr : '${'done'.tr}(${value.length})',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: value.isEmpty
                          ? const Color(0xFFBFBFBF)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                ValueListenableBuilder(
                  valueListenable: _contactListNotifier,
                  builder: (_, value, __) => value.isEmpty
                      ? ECSearechLine(onPressed: () {})
                      : _buildSelectContactListLine(),
                ),
                Expanded(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      ...[
                        SliverToBoxAdapter(
                          child: ECSectionLine(
                            title: 'select_a_group'.tr,
                            onPressed: () {},
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: ECSectionLine(
                            title: 'join_private_group'.tr,
                            onPressed: () {},
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: ECSectionLine(
                            title: 'select_we_com_contact'.tr,
                            onPressed: () {},
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ].mapWithSeparator(
                        (e) => const SliverToBoxAdapter(
                          child: Divider(
                            height: .4,
                            thickness: .4,
                            color: Color(0xFFE7E7E7),
                          ),
                        ),
                      ),
                      ..._sortedContacts.map(_buildContactItem),
                    ],
                  ),
                ),
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
          itemBuilder: (_, index) => ContactInfoLine(
            info: infos[index],
            canChoose: true,
            onChecked: (isChecked, info) {
              if (info == null) return;
              if (isChecked) {
                _contactListNotifier.add(info);
              } else {
                _contactListNotifier.remove(info);
              }
              _scrollController.jumpTo(
                _contactListNotifier.value.length * 40.0 +
                    (_contactListNotifier.value.length - 1) * 10.0,
              );
            },
          ),
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

  Widget _buildSelectContactListLine() => ValueListenableBuilder(
        valueListenable: _contactListNotifier,
        builder: (_, value, __) => Container(
          padding: const EdgeInsets.all(10.0),
          color: const Color(0xFFEDEDED),
          child: Container(
            height: 60.0,
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              color: Colors.white,
            ),
            child: ListView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                for (final e in value)
                  e.icon == null
                      ? const Placeholder()
                      : ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                          child: Image.asset(
                            e.icon!,
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.fill,
                          ),
                        ),
              ].mapWithSeparator(
                (e) => const SizedBox(width: 10.0),
              ),
            ),
          ),
        ),
      );
}

class _ContactListNotifier extends ChangeNotifier implements ValueListenable {
  List<ContactInfo> _list = [];

  @override
  List<ContactInfo> get value => _list;

  set value(List<ContactInfo>? value) {
    if (value == null) return;
    _list = value;
    notifyListeners();
  }

  void add(ContactInfo value) {
    _list.add(value);
    notifyListeners();
  }

  void remove(ContactInfo value) {
    _list.remove(value);
    notifyListeners();
  }

  bool get isEmpty => _list.isEmpty;
}
