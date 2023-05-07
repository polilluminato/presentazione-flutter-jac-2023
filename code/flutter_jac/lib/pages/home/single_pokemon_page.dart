import 'package:flutter/material.dart';
import 'package:flutter_jac/models/pokemon_item.dart';
import 'package:go_router/go_router.dart';

class SinglePokemonPage extends StatelessWidget {
  const SinglePokemonPage({super.key, required this.pokemon});

  final PokemonItem pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Container(),
    );
  }
}
