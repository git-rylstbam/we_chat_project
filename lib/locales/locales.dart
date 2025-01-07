import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// CreateDate: 2025/1/6 9:51
/// Author: Lee
/// Description:

class Locales extends Translations {
  static const cn = Locale('zh', 'CN');
  static const en = Locale('en', 'US');

  static const supported = [cn, en];

  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': _buildCNTranslations(),
        'en_US': _buildUSTranslations(),
      };

  Map<String, String> _buildCNTranslations() => {
        'chats': '微信',
        'contacts': '通讯录',
        'discover': '发现',
        'me': '我的',
        'weixin': '微信',
        'weixin_id': '微信号',
        'status': '状态',
        'pay_and_services': '服务',
        'favorites': '收藏',
        'moments': '朋友圈',
        'cards_and_offers': '卡包',
        'sticker_gallery': '表情',
        'settings': '设置',
        'channels': '视频号',
        'live': '直播',
        'scan': '扫一扫',
        'listen': '听一听',
        'top_stories': '看一看',
        'search': '搜一搜',
        'nearby': '附近',
        'shopping': '购物',
        'games': '游戏',
        'mini_programs': '小程序',
        'new_friends': '新的朋友',
        'group_chats': '群聊',
        'tags': '标签',
        'official_accounts': '公众号',
        'service_account': '服务号',
        'we_com_contacts': '企业微信联系人',
        'new_chat': '发起群聊',
        'add_contacts': '添加朋友',
        'money': '收付款',
      };

  Map<String, String> _buildUSTranslations() => {
        'chats': 'Chats',
        'contacts': 'Contacts',
        'discover': 'Discover',
        'me': 'Me',
        'weixin': 'Weixin',
        'weixin_id': 'Weixin ID',
        'status': 'Status',
        'pay_and_services': 'Pay and Services',
        'favorites': 'Favorites',
        'moments': 'Moments',
        'cards_and_offers': 'Cards & Offers',
        'sticker_gallery': 'Sticker Gallery',
        'settings': 'Settings',
        'channels': 'Channels',
        'live': 'Live',
        'scan': 'Scan',
        'listen': 'Listen',
        'top_stories': 'Top Stories',
        'search': 'Search',
        'nearby': 'Nearby',
        'shopping': 'Shopping',
        'games': 'Games',
        'mini_programs': 'Mini Programs',
        'new_friends': 'New Friends',
        'group_chats': 'Group Chats',
        'tags': 'Tags',
        'official_accounts': 'Official Accounts',
        'service_account': 'Service Account',
        'we_com_contacts': 'WeCom Contacts',
        'new_chat': 'New Chat',
        'add_contacts': 'Add Contacts',
        'money': 'Money',
      };
}
