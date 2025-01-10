import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'contact/contact_page.dart';
import 'discover/discover_page.dart';
import 'individual/individual_page.dart';
import 'initial/initial_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeStatusNotifier =
      ValueNotifier<HomeStatusEnum>(HomeStatusEnum.initial);

  @override
  void dispose() {
    _homeStatusNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _homeStatusNotifier,
                builder: (_, value, __) => switch (value) {
                  HomeStatusEnum.initial => const InitialPage(),
                  HomeStatusEnum.contact => const ContactPage(),
                  HomeStatusEnum.discover => const DiscoverPage(),
                  _ => const IndividualPage(),
                },
              ),
            ),
            _HomeBottomNavigator(
              onSelected: (value) => _homeStatusNotifier.value = value,
            ),
          ],
        ),
      );
}

class _HomeBottomNavigator extends StatefulWidget {
  const _HomeBottomNavigator({required this.onSelected});

  final void Function(HomeStatusEnum status) onSelected;

  @override
  State<_HomeBottomNavigator> createState() => _HomeBottomNavigatorState();
}

class _HomeBottomNavigatorState extends State<_HomeBottomNavigator> {
  HomeStatusEnum _selectNavigator = HomeStatusEnum.initial;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF4F4F4), Color(0xFFF7F7F7)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: HomeStatusEnum.values
                .map(
                  (e) => _buildSingleNavigator(e),
                )
                .toList(),
          ),
        ),
      );

  Widget _buildSingleNavigator(HomeStatusEnum status) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            setState(() => _selectNavigator = status);
            widget.onSelected(status);
          },
          child: Column(
            spacing: 4.0,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                status.icon,
                color: _selectNavigator == status
                    ? const Color(0xFF1FC263)
                    : const Color(0xFF1C1C1C),
              ),
              Text(
                status.show.tr,
                style: TextStyle(
                  fontSize: 12.0,
                  color: _selectNavigator == status
                      ? const Color(0xFF1FC263)
                      : const Color(0xFF1C1C1C),
                ),
              ),
            ],
          ),
        ),
      );
}

enum HomeStatusEnum {
  initial('chats', Icons.ac_unit),
  contact('contacts', Icons.agriculture),
  discover('discover', Icons.linear_scale),
  individual('me', Icons.cruelty_free);

  const HomeStatusEnum(this.show, this.icon);

  final String show;
  final IconData icon;
}
