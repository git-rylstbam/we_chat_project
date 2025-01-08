import 'package:flutter/material.dart';

import '../../../utils/icon_util.dart';

/// CreateDate: 2025/1/7 9:43
/// Author: Lee
/// Description:

const letters = [
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
  '#',
];

class ContactEntity implements Comparable {
  const ContactEntity({this.tag, this.list});

  final String? tag;
  final List<ContactInfo>? list;

  @override
  int compareTo(other) => tag!.compareTo(other.tag!);
}

class ContactInfo implements Comparable {
  const ContactInfo({required this.id, this.icon, this.name});

  final int id;
  final String? icon;
  final String? name;

  @override
  int compareTo(other) => name!.compareTo(other.name!);
}

const List<ContactEntity> contacts = [
  ContactEntity(
    tag: 'L',
    list: [
      ContactInfo(id: 0, icon: IconUtil.icon_002, name: '刘德华'),
      ContactInfo(id: 1, icon: IconUtil.icon_003, name: '黎明'),
      ContactInfo(id: 2, icon: IconUtil.icon_004, name: '刘诗诗'),
      ContactInfo(id: 3, icon: IconUtil.icon_005, name: '刘亦菲'),
      ContactInfo(id: 4, icon: IconUtil.icon_006, name: '林落凝'),
      ContactInfo(id: 5, icon: IconUtil.icon_007, name: '陆若柒'),
      ContactInfo(id: 6, icon: IconUtil.icon_008, name: '刘嘉玲'),
      ContactInfo(id: 7, icon: IconUtil.icon_009, name: '梁朝伟'),
      ContactInfo(id: 8, icon: IconUtil.icon_010, name: '栾云平'),
    ],
  ),
  ContactEntity(
    tag: 'C',
    list: [
      ContactInfo(id: 9, icon: IconUtil.icon_033, name: '陈佩斯'),
      ContactInfo(id: 10, icon: IconUtil.icon_034, name: '崔永元'),
    ],
  ),
  ContactEntity(
    tag: 'S',
    list: [
      ContactInfo(id: 11, icon: IconUtil.icon_030, name: '沈腾'),
      ContactInfo(id: 12, icon: IconUtil.icon_031, name: '宋丹丹'),
    ],
  ),
  ContactEntity(
    tag: 'B',
    list: [
      ContactInfo(id: 13, icon: IconUtil.icon_001, name: '白鹿'),
      ContactInfo(id: 14, icon: IconUtil.icon_028, name: '白子画'),
    ],
  ),
  ContactEntity(
    tag: 'T',
    list: [
      ContactInfo(id: 15, icon: IconUtil.icon_027, name: '唐伯虎'),
      ContactInfo(id: 16, icon: IconUtil.icon_020, name: '弹一闪'),
    ],
  ),
  ContactEntity(
    tag: 'Z',
    list: [
      ContactInfo(id: 17, icon: IconUtil.icon_011, name: '张曼玉'),
      ContactInfo(id: 18, icon: IconUtil.icon_012, name: '张学友'),
      ContactInfo(id: 19, icon: IconUtil.icon_013, name: '赵露思'),
      ContactInfo(id: 20, icon: IconUtil.icon_014, name: '赵丽颖'),
      ContactInfo(id: 21, icon: IconUtil.icon_015, name: '周星驰'),
      ContactInfo(id: 22, icon: IconUtil.icon_016, name: '张国立'),
      ContactInfo(id: 23, icon: IconUtil.icon_017, name: '张铁林'),
      ContactInfo(id: 24, icon: IconUtil.icon_018, name: '赵本山'),
      ContactInfo(id: 25, icon: IconUtil.icon_019, name: '周涛'),
    ],
  ),
  ContactEntity(
    tag: 'F',
    list: [
      ContactInfo(id: 26, icon: IconUtil.icon_028, name: '范冰冰'),
      ContactInfo(id: 27, icon: IconUtil.icon_029, name: '冯巩'),
    ],
  ),
  ContactEntity(
    tag: 'W',
    list: [
      ContactInfo(id: 28, icon: IconUtil.icon_024, name: '吴奇隆'),
      ContactInfo(id: 29, icon: IconUtil.icon_025, name: '王宝强'),
      ContactInfo(id: 30, icon: IconUtil.icon_026, name: '王刚'),
    ],
  ),
  ContactEntity(
    tag: 'G',
    list: [
      ContactInfo(id: 31, icon: IconUtil.icon_020, name: '郭富城'),
      ContactInfo(id: 32, icon: IconUtil.icon_021, name: '关晓彤'),
      ContactInfo(id: 33, icon: IconUtil.icon_022, name: '郭德纲'),
      ContactInfo(id: 34, icon: IconUtil.icon_023, name: '高峰'),
    ],
  ),
  ContactEntity(
    tag: 'J',
    list: [ContactInfo(id: 35, icon: IconUtil.icon_032, name: '贾玲')],
  ),
  ContactEntity(
    tag: 'N',
    list: [
      ContactInfo(id: 36, icon: IconUtil.icon_039, name: '倪萍'),
      ContactInfo(id: 37, icon: IconUtil.icon_002, name: '倪妮'),
    ],
  ),
  ContactEntity(
    tag: 'Y',
    list: [
      ContactInfo(id: 38, icon: IconUtil.icon_035, name: '袁立'),
      ContactInfo(id: 39, icon: IconUtil.icon_036, name: '闫妮'),
      ContactInfo(id: 40, icon: IconUtil.icon_037, name: '于谦'),
      ContactInfo(id: 41, icon: IconUtil.icon_038, name: '岳云鹏'),
    ],
  ),
];

class ContactOperationEntity {
  const ContactOperationEntity({this.icon, this.title, this.color});

  final IconData? icon;
  final String? title;
  final Color? color;
}

const operations = [
  ContactOperationEntity(
    icon: Icons.accessibility,
    title: 'new_friends',
    color: Colors.orange,
  ),
  ContactOperationEntity(
    icon: Icons.baby_changing_station,
    title: 'group_chats',
    color: Colors.green,
  ),
  ContactOperationEntity(
    icon: Icons.assured_workload,
    title: 'tags',
    color: Colors.blue,
  ),
  ContactOperationEntity(
    icon: Icons.auto_awesome,
    title: 'official_accounts',
    color: Colors.blue,
  ),
  ContactOperationEntity(
    icon: Icons.beach_access,
    title: 'service_account',
    color: Colors.blue,
  ),
  ContactOperationEntity(
    icon: Icons.balance,
    title: 'we_com_contacts',
    color: Colors.blue,
  ),
];
