import 'package:flutter/material.dart';

import '../../../utils/icon_util.dart';

/// CreateDate: 2025/1/7 15:35
/// Author: Lee
/// Description:

class UserEntity {
  const UserEntity({
    this.icon,
    this.name,
    this.count,
    this.message,
    this.time,
    this.dnd = false,
  });

  final String? icon;
  final String? name;
  final int? count;
  final String? message;
  final String? time;
  final bool dnd;
}

const users = [
  UserEntity(
    icon: IconUtil.icon_001,
    name: '白鹿',
    count: 20,
    message: '无边落木萧萧下，不尽长江滚滚来',
    time: '09:18',
    dnd: true,
  ),
  UserEntity(
    icon: IconUtil.icon_002,
    name: '赵露思',
    count: 490,
    message: '人生如雪，墨点为缀；花开落蕊，雪化成灰。',
    time: '09:12',
  ),
  UserEntity(
    icon: IconUtil.icon_003,
    name: '刘德华',
    count: 2,
    message: '我要的东西呢？',
    time: '昨天 17:39',
    dnd: true,
  ),
  UserEntity(
    icon: IconUtil.icon_004,
    name: '周星驰',
    count: 0,
    message: '曾经有一份真挚的爱情摆在我面前，而我却没有珍惜，等到失去的时候才后悔莫及。',
    time: '09:12',
    dnd: true,
  ),
  UserEntity(
    icon: IconUtil.icon_005,
    name: '张国立',
    count: 9,
    message: '谁说书生百无一用，铁齿铜牙咬死你。',
    time: '09:12',
  ),
  UserEntity(
    icon: IconUtil.icon_006,
    name: '王刚',
    count: 0,
    message: '为什么受伤的总是我啊？',
    time: '02:00',
    dnd: true,
  ),
  UserEntity(
    icon: IconUtil.icon_007,
    name: '范伟',
    count: 38,
    message: '没事儿走两步。',
    time: '09:12',
    dnd: true,
  ),
  UserEntity(
    icon: IconUtil.icon_008,
    name: '赵本山',
    count: 97,
    message: '母猪的产后护理。这知识啊，都学咋啦！',
    time: '09:12',
    dnd: true,
  ),
  UserEntity(
    icon: IconUtil.icon_009,
    name: '王宝强',
    count: 12,
    message: '有意义就是好好活，好好活就是做很多很多有意义的事儿。',
    time: '09:12',
    dnd: true,
  ),
  UserEntity(
    icon: IconUtil.icon_010,
    name: '张艺谋',
    count: 490,
    message: '高板凳低木头都是他舅。',
    time: '09:12',
    dnd: true,
  ),
  UserEntity(
    icon: IconUtil.icon_011,
    name: '冯小刚',
    count: 40,
    message: '嗬，忘了一干净！',
    time: '14:56',
  ),
  UserEntity(
    icon: IconUtil.icon_012,
    name: '成龙',
    count: 0,
    message: '热血男儿汗，比太阳更光！去开天辟地，带我理想去闯。',
    time: '10:02',
  ),
  UserEntity(
    icon: IconUtil.icon_013,
    name: '白冰',
    count: 7,
    message: '粉丝都管我叫小金喜善，其实我更想他们叫我白冰。',
    time: '11:40',
    dnd: true,
  ),
  UserEntity(
    icon: IconUtil.icon_014,
    name: '陈凯歌',
    count: 0,
    message: '剑外忽传收蓟北，初闻涕泪满衣裳。',
    time: '09:12',
    dnd: true,
  ),
  UserEntity(
    icon: IconUtil.icon_015,
    name: '张曼玉',
    count: 0,
    message: '老娘叫金镶玉，在关外沙漠深处有一家客栈，号《龙门客栈》。',
    time: '08:08',
    dnd: true,
  ),
];

class OperationEntity {
  const OperationEntity({required this.id, this.icon, this.title});

  final int id;
  final IconData? icon;
  final String? title;
}

const operations = [
  OperationEntity(id: 0, icon: Icons.notification_add, title: 'new_chat'),
  OperationEntity(id: 1, icon: Icons.person_add_alt, title: 'add_contacts'),
  OperationEntity(id: 2, icon: Icons.pool, title: 'scan'),
  OperationEntity(id: 3, icon: Icons.tips_and_updates, title: 'money'),
];
