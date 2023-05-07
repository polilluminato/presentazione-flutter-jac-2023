import 'package:flutter_jac/models/pokemon_item.dart';
import 'package:flutter_jac/pages/home/home_page.dart';
import 'package:flutter_jac/pages/home/single_pokemon_page.dart';
import 'package:flutter_jac/pages/settings_page.dart';
import 'package:go_router/go_router.dart';

GoRouter buildRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: '/pokemon/single',
        builder: (context, state) => SinglePokemonPage(
          pokemonItem: state.extra! as PokemonItem,
        ),
      ),
    ],
  );
}
