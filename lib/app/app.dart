import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khanatime26/app/router.dart';
import 'package:khanatime26/app/theme.dart';

class KhanatimeApp extends ConsumerWidget {
  const KhanatimeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Khanatime26',
      theme: appTheme,
      darkTheme: appDarkTheme,
      routerConfig: router,
    );
  }
}
