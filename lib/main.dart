import 'package:ecomerce_kotlin/routers/app_router.dart';
import 'package:ecomerce_kotlin/widget/core/responsive_app_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// Hapus animasi transisi antar‐halaman.
class NoTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return child;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      // Bungkus dengan ResponsiveAppWrapper (sesuaikan importmu)
      builder: (context, child) => ResponsiveAppWrapper(
        child: child!,
        backgroundColor: const Color(0xFFFFFFFF),
        minWidth: 420.0,
        maxWidth: 580.0,
        idealAspectRatio: 9 / 16,
        minAspectRatio: 0.8,
        maxAspectRatio: 0.85,
        enableDebugOutline: kDebugMode && false,
      ),
      title: 'Ecommerce Apps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme:
        ColorScheme.fromSeed(seedColor: const Color(0xFFFFFFFF)),
        useMaterial3: true,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            for (var platform in TargetPlatform.values)
              platform: NoTransitionsBuilder(),
          },
        ),
      ),
      routerConfig: router,
    );
  }
}
