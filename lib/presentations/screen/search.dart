import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final bool isWeb = kIsWeb;

    // contoh watch provider, jika ada
    // final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Center(
        child: Text(
          'Search Page\nDevice height: ${deviceHeight.toStringAsFixed(0)}\nPlatform: ${isWeb ? "Web" : "Mobile"}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
