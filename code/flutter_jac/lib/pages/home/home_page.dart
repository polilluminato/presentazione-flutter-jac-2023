import 'package:flutter/material.dart';
import 'package:flutter_jac/models/screen_tab.dart';
import 'package:flutter_jac/pages/home/tabs/gallery_tab.dart';
import 'package:flutter_jac/pages/home/tabs/ip_location_tab.dart';
import 'package:flutter_jac/pages/home/tabs/news_list_tab.dart';
import 'package:flutter_jac/pages/home/tabs/pokemon_list_tab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final indexTabProvider = StateProvider<int>((ref) => 0);

final List<ScreenTab> tabList = [
  ScreenTab(
    label: "Pokemon",
    icon: Icons.flutter_dash_outlined,
    content: const PokemonListTab(),
  ),
  ScreenTab(
    label: "News",
    icon: Icons.list_alt,
    content: const NewsListTab(),
  ),
  ScreenTab(
    label: "Gallery",
    icon: Icons.grid_view,
    content: const GalleryTab(),
  ),
  ScreenTab(
    label: "Location",
    icon: Icons.location_on_outlined,
    content: const IpLocationTab(),
  ),
];

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Flutter Demo @ Jac",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () => context.push('/settings'),
            ),
          )
        ],
      ),
      body: tabList[ref.watch(indexTabProvider)].content,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          ref.read(indexTabProvider.notifier).state = index;
        },
        selectedIndex: ref.watch(indexTabProvider),
        destinations: tabList
            .map(
              (singleScreenTab) => NavigationDestination(
                icon: Icon(singleScreenTab.icon),
                label: singleScreenTab.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
