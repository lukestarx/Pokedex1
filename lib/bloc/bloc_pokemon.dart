import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/EventPokemon.dart';
import 'package:pokedex/poke_repository.dart';
import 'package:pokedex/StatePokemon.dart';


class PokemonBloc extends Bloc<EventPokemon, StatePokemon> {
  final _repositoryPokemon =Repopoke();

  PokemonBloc() : super(PokemonInitial());

  static PokemonInitial pokemonInitial() => PokemonInitial();

    Stream<StatePokemon> mapEventToState(EventPokemon event)async* {
      if (event is PokemonPageRequest) {
              yield PokemonLoadProgress();
      
              try{
              final pokemonPageResponse =await _repositoryPokemon.getPokemonPage(0);
              yield PokemonPageLoadSuccess(
                pokemonLists : pokemonPageResponse.pokemonLists,
                canloadNextPage: pokemonPageResponse.canLoadNextPage);
            } catch (e) {
              yield PokemonPageLoadFailed(error: e);
            }
            }
            }
      }
      
      class PokemonPageRequest {
}