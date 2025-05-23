import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final bool isWeb = kIsWeb;

    // contoh watch provider, jika ada
    // final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Center(
        child: Text(
          'Cart Page\nDevice height: ${deviceHeight.toStringAsFixed(0)}\nPlatform: ${isWeb ? "Web" : "Mobile"}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
