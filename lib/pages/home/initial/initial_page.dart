import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../extensions/list_extensions.dart';
import '../../../routes.dart';
import '../../../widgets/ec_search_line.dart';
import 'model.dart';
import 'widgets/operate_button.dart';

/// CreateDate: 2025/1/6 9:22
/// Author: Lee
/// Description:

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with AutomaticKeepAliveClientMixin {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    for (final e in users) {
      if (!e.dnd) _count += e.count ?? 0;
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFEDEDED),
        title: Text(
          '${'weixin'.tr} ($_count)',
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xFF1B1B1B),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [OperateButton()],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ECSearechLine(onPressed: () {}),
          ...users
              .map((e) => _UserChatLine(user: e, count: _count))
              .toList()
              .mapWithSeparator(
                (e) => const Divider(
                  height: .4,
                  thickness: .4,
                  color: Color(0xFFE7E7E7),
                ),
              ),
        ],
      ),
    );
  }
}

class _UserChatLine extends StatelessWidget {
  const _UserChatLine({
    required this.user,
    required this.count,
  });

  final UserEntity user;
  final int count;

  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Get.toNamed(
            Routes.chat_to_user,
            arguments: user,
            parameters: {'count': count.toString()},
          ),
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(10.0),
            child: Row(
              spacing: 10.0,
              children: [
                if (user.count != 0)
                  Badge(
                    backgroundColor: Colors.red,
                    smallSize: 8.0,
                    label: user.dnd
                        ? null
                        : user.count != null && user.count! <= 99
                            ? Text('${user.count}')
                            : const Icon(
                                Icons.more_horiz,
                                size: 14.0,
                                color: Colors.white,
                              ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3.0, right: 3.0),
                      child: _buildUserAvatar(),
                    ),
                  )
                else
                  _buildUserAvatar(),
                Expanded(
                  child: Column(
                    spacing: 4.0,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name ?? '--',
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      Row(
                        spacing: 4.0,
                        children: [
                          if (user.count != 0)
                            Text(
                              '[${user.count}条]',
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Color(0xFFB8B8B8),
                              ),
                            ),
                          Expanded(
                            child: Text(
                              user.message ?? '--',
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Color(0xFFB8B8B8),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  spacing: 4.0,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      user.time ?? '--',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFFB8B8B8),
                      ),
                    ),
                    if (user.dnd)
                      const Icon(
                        Icons.hearing_disabled,
                        size: 12.0,
                        color: Color(0xFFB8B8B8),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildUserAvatar() => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        child: user.icon == null
            ? const Placeholder()
            : Image.asset(
                user.icon!,
                fit: BoxFit.fill,
                width: 40.0,
                height: 40.0,
              ),
      );
}
