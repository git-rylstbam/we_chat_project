import 'package:flutter/material.dart';

/// CreateDate: 2025/1/6 9:23
/// Author: Lee
/// Description:

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text('Discover Page')),
      );
}
