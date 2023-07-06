import 'package:flutter/material.dart';
import 'package:flutter_jac/models/screen_tab.dart';
import 'package:flutter_jac/pages/home/tabs/gallery/gallery_tab.dart';
import 'package:flutter_jac/pages/home/tabs/ip_location_tab.dart';
import 'package:flutter_jac/pages/home/tabs/news/news_list_tab.dart';
import 'package:flutter_jac/pages/home/tabs/pokemon/pokemon_list_tab.dart';
import 'package:flutter_jac/pages/home/tabs/splash_tab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexTabProvider = StateProvider<int>((ref) => 0);

final List<ScreenTab> tabList = [
  ScreenTab(
    label: "Home",
    icon: Icons.home_outlined,
    content: const SplashTab(),
  ),
  ScreenTab(
    label: "Pokemon",
    icon: Icons.flutter_dash,
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
