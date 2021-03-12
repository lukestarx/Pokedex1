import 'package:flutter/cupertino.dart';
import 'package:pokedex/pageforpokemon.dart';

abstract class StatePokemon {} 

class PokemonInitial extends StatePokemon{}

class PokemonLoadProgress extends StatePokemon{}

class PokemonPageLoadSuccess extends StatePokemon{
  final List<PokemonPageResponse>pokemonLists;
  final bool canloadNextPage;

    PokemonPageLoadSuccess(
        {@required this.pokemonLists, @required this.canloadNextPage});
}

class PokemonPageLoadFailed extends StatePokemon {
      final Error error;

      PokemonPageLoadFailed({@required this.error});
}