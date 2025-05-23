import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerStatefulWidget {
  /// Param `id` ditangkap dari GoRoute pathParameters.
  final String id;

  const DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final bool isWeb = kIsWeb;

    // contoh watch provider, jika ada
    // final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail: ${widget.id}'),
      ),
      body: Center(
        child: Text(
          'Detail Page for ID = ${widget.id}\n'
              'Device height: ${deviceHeight.toStringAsFixed(0)}\n'
              'Platform: ${isWeb ? "Web" : "Mobile"}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
