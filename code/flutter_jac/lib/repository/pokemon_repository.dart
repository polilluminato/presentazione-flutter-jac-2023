import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jac/env/env.dart';
import 'package:flutter_jac/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  PokemonRepository();

  Future<Pokemon> getSinglePokemon(int id) async {
    var response = await http.get(
      Uri.parse("${Env.pokemonApiUrl}/pokemon/$id"),
    );

    debugPrint(response.body);
    return Pokemon.fromJson(json.decode(response.body));
  }
}
