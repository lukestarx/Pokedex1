import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/pageforpokemon.dart';


class Repopoke{
  final baseUrl ='pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse>getPokemonPage(int pageIndex) async {
    // pokemon?limit=151&offset=0

    final queryParameters ={
      'limit' :'150',
      'offset' : (pageIndex *150).toString()
    };

    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParameters);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromjson(json);
  }
}