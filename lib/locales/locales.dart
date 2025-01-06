import 'package:get/get.dart';

/// CreateDate: 2025/1/6 9:51
/// Author: Lee
/// Description:

class Locales extends Translations {
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
      };
}
