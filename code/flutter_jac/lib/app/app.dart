import 'package:flutter/material.dart';
import 'package:flutter_jac/app/router.dart';
import 'package:flutter_jac/provider/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  App({Key? key}) : super(key: key);

  late final router = buildRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: ThemeData(
        useMaterial3: true,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        colorSchemeSeed: Colors.grey,
        brightness:
            ref.watch(isDarkModeProvider) ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
