// ignore_for_file: library_prefixes, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_jac/models/pokemon.dart';
import 'package:flutter_jac/models/pokemon_item.dart';
import 'package:flutter_jac/provider/AsyncValueWidget.dart';
import 'package:flutter_jac/provider/pokemon_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SinglePokemonPage extends ConsumerWidget {
  const SinglePokemonPage({super.key, required this.pokemonItem});

  final PokemonItem pokemonItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPokemon = ref.watch(singlePokemonProvider(pokemonItem.id!));
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonItem.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: AsyncValueWidget<Pokemon>(
        value: myPokemon,
        data: (myPokemon) {
          return Text(myPokemon.name);
        },
      ),
    );
  }
}
