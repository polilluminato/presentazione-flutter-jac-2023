// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';

class SplashTab extends StatelessWidget {
  const SplashTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Text(
        "Hello World!",
        style: textTheme.headlineMedium,
      ),
    );
  }
}
