import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';
import 'theme.dart';

void main() => runApp(const _MyApp());

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'High Copy WeChat Project',
        theme: lightTheme,
        home: const HomePage(),
      );
}
