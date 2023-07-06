import 'package:flutter/material.dart';
import 'package:flutter_jac/data/pokemon_list.dart';
import 'package:flutter_jac/models/pokemon_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PokemonListTab extends ConsumerWidget {
  const PokemonListTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        PokemonItem myPokemon = pokemonList[index];

        //Lista semplice con solo il nome del Pokemon
        // return Text(myPokemon.name);

        //Lista graficata con la classe
        return PokemonRow(myPokemon: myPokemon);
      },
    );
  }
}

class PokemonRow extends StatelessWidget {
  const PokemonRow({super.key, required this.myPokemon});

  final PokemonItem myPokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        onTap: () {
          context.push(
            '/pokemon/single',
            extra: myPokemon,
          );
        },
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(myPokemon.imageLink ?? ""),
        ),
        title: Text(myPokemon.name),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
