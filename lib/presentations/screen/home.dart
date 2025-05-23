import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final bool isWeb = kIsWeb;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Text(
          'Home Page\nDevice height: ${deviceHeight.toStringAsFixed(0)}\nPlatform: ${isWeb ? "Web" : "Mobile"}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
