import 'package:flutter/material.dart';
import 'package:flutter_jac/provider/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Enable Dark Mode"),
            trailing: Switch(
              value: ref.watch(isDarkModeProvider),
              onChanged: (value) {
                ref.read(isDarkModeProvider.notifier).update((state) => value);
              },
            ),
          )
        ],
      ),
    );
  }
}
