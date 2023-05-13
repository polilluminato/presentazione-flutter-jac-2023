import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonListTab extends ConsumerWidget {
  const PokemonListTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text("Lista Pokémon"),
      // child: ElevatedButton(
      //   onPressed: () {
      //     context.push(
      //       '/pokemon/single',
      //       extra: pokemonList[0],
      //     );
      //   },
      //   child: const Text("Bulbasaur"),
      // ),
    );
  }
}
