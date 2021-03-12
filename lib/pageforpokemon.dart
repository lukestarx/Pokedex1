/*
count:1118
next:"https://pokeapi.co/api/v2/pokemon?offset=300&limit=100"
previous:"https://pokeapi.co/api/v2/pokemon?offset=100&limit=100"
result: [ {Name:"Unkown"}]
url: "https://pokeapi.co/api/v2/pokemon/1"}
  {name:"Bulbasaur"
url: "https://pokeapi.co/api/v2/pokemon/2"}
  {name:"Ivysaur"
url: "https://pokeapi.co/api/v2/pokemon/3"}

]
*/



import 'package:flutter/cupertino.dart';

class PokemonLists {
  final int id;
  final String name;

  String get imageUrl =>
  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

   
  PokemonLists ({@required this.id, @required this.name});




factory PokemonLists.fromjson(Map<String, dynamic> json) {
  final name = json ['name'];
  final url = json ['url'] as String; 
  final id = int.parse(url.split('/')[6]);


  return PokemonLists(id: id, name : name);
}
}

class PokemonPageResponse {
  final List<PokemonLists> pokemonLists;
  final bool canLoadNextPage;

  PokemonPageResponse(
    {@required this.pokemonLists, @required this.canLoadNextPage});
    
  factory PokemonPageResponse.fromjson(Map<String, dynamic>json){
    final canLoadNextPage = json['next'] !=null;
    final pokemonLists = (json['result'] as  List)
    .map((listingJson) => PokemonLists.fromjson(listingJson))
    .toList();

    return PokemonPageResponse (pokemonLists: pokemonLists, canLoadNextPage: canLoadNextPage);
  }
}