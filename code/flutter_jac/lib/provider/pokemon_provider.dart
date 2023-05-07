import 'package:flutter_jac/models/pokemon.dart';
import 'package:flutter_jac/repository/pokemon_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_provider.g.dart';

@riverpod
Future<Pokemon> singlePokemon(SinglePokemonRef ref, int id) async {
  return PokemonRepository().getSinglePokemon(id);
}
