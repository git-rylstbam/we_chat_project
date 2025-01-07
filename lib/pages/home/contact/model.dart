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
  const ContactInfo({this.icon, this.name});

  final String? icon;
  final String? name;

  @override
  int compareTo(other) => name!.compareTo(other.name!);
}

const List<ContactEntity> contacts = [
  ContactEntity(
    tag: 'L',
    list: [
      ContactInfo(icon: IconUtil.icon_002, name: '刘德华'),
      ContactInfo(icon: IconUtil.icon_003, name: '黎明'),
      ContactInfo(icon: IconUtil.icon_004, name: '刘诗诗'),
      ContactInfo(icon: IconUtil.icon_005, name: '刘亦菲'),
      ContactInfo(icon: IconUtil.icon_006, name: '林落凝'),
      ContactInfo(icon: IconUtil.icon_007, name: '陆若柒'),
      ContactInfo(icon: IconUtil.icon_008, name: '刘嘉玲'),
      ContactInfo(icon: IconUtil.icon_009, name: '梁朝伟'),
      ContactInfo(icon: IconUtil.icon_010, name: '栾云平'),
    ],
  ),
  ContactEntity(
    tag: 'C',
    list: [
      ContactInfo(icon: IconUtil.icon_033, name: '陈佩斯'),
      ContactInfo(icon: IconUtil.icon_034, name: '崔永元'),
    ],
  ),
  ContactEntity(
    tag: 'S',
    list: [
      ContactInfo(icon: IconUtil.icon_030, name: '沈腾'),
      ContactInfo(icon: IconUtil.icon_031, name: '宋丹丹'),
    ],
  ),
  ContactEntity(
    tag: 'B',
    list: [
      ContactInfo(icon: IconUtil.icon_001, name: '白鹿'),
      ContactInfo(icon: IconUtil.icon_028, name: '白子画'),
    ],
  ),
  ContactEntity(
    tag: 'T',
    list: [
      ContactInfo(icon: IconUtil.icon_027, name: '唐伯虎'),
      ContactInfo(icon: IconUtil.icon_020, name: '弹一闪'),
    ],
  ),
  ContactEntity(
    tag: 'Z',
    list: [
      ContactInfo(icon: IconUtil.icon_011, name: '张曼玉'),
      ContactInfo(icon: IconUtil.icon_012, name: '张学友'),
      ContactInfo(icon: IconUtil.icon_013, name: '赵露思'),
      ContactInfo(icon: IconUtil.icon_014, name: '赵丽颖'),
      ContactInfo(icon: IconUtil.icon_015, name: '周星驰'),
      ContactInfo(icon: IconUtil.icon_016, name: '张国立'),
      ContactInfo(icon: IconUtil.icon_017, name: '张铁林'),
      ContactInfo(icon: IconUtil.icon_018, name: '赵本山'),
      ContactInfo(icon: IconUtil.icon_019, name: '周涛'),
    ],
  ),
  ContactEntity(
    tag: 'F',
    list: [
      ContactInfo(icon: IconUtil.icon_028, name: '范冰冰'),
      ContactInfo(icon: IconUtil.icon_029, name: '冯巩'),
    ],
  ),
  ContactEntity(
    tag: 'W',
    list: [
      ContactInfo(icon: IconUtil.icon_024, name: '吴奇隆'),
      ContactInfo(icon: IconUtil.icon_025, name: '王宝强'),
      ContactInfo(icon: IconUtil.icon_026, name: '王刚'),
    ],
  ),
  ContactEntity(
    tag: 'G',
    list: [
      ContactInfo(icon: IconUtil.icon_020, name: '郭富城'),
      ContactInfo(icon: IconUtil.icon_021, name: '关晓彤'),
      ContactInfo(icon: IconUtil.icon_022, name: '郭德纲'),
      ContactInfo(icon: IconUtil.icon_023, name: '高峰'),
    ],
  ),
  ContactEntity(
    tag: 'J',
    list: [ContactInfo(icon: IconUtil.icon_032, name: '贾玲')],
  ),
  ContactEntity(
    tag: 'N',
    list: [
      ContactInfo(icon: IconUtil.icon_039, name: '倪萍'),
      ContactInfo(icon: IconUtil.icon_002, name: '倪妮'),
    ],
  ),
  ContactEntity(
    tag: 'Y',
    list: [
      ContactInfo(icon: IconUtil.icon_035, name: '袁立'),
      ContactInfo(icon: IconUtil.icon_036, name: '闫妮'),
      ContactInfo(icon: IconUtil.icon_037, name: '于谦'),
      ContactInfo(icon: IconUtil.icon_038, name: '岳云鹏'),
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
