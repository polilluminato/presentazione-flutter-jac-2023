import 'package:flutter/material.dart';
import 'package:flutter_jac/app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
