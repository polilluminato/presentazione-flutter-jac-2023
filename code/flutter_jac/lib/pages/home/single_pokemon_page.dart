// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_jac/models/pokemon.dart';
import 'package:flutter_jac/models/pokemon_item.dart';
import 'package:flutter_jac/provider/AsyncValueWidget.dart';
import 'package:flutter_jac/provider/pokemon_provider.dart';
import 'package:flutter_jac/utils/screen_utils.dart' as ScreenUtils;
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
          return SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  myPokemon.imageLink,
                  width: ScreenUtils.getScreenWidth(context) * .5,
                ),
                Text(
                  myPokemon.name,
                  style: textTheme.displaySmall,
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              "${myPokemon.weight}",
                              style: textTheme.headlineMedium,
                            ),
                            Text(
                              "Weight",
                              style: textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              "${myPokemon.height}",
                              style: textTheme.headlineMedium,
                            ),
                            Text(
                              "Height",
                              style: textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
