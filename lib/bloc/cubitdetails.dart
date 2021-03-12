import 'package:pokedex/data/detailpokemon.dart';
import 'package:pokedex/data/pokemoninforesponse.dart';
import 'package:pokedex/data/poke_repository.dart';
import 'package:pokedex/data/speciespokemon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails> {
  final _repositorypokemon = Repopoke();

  PokemonDetailsCubit() : super(null);

  void getPokemonDetails(int pokemonId) async {
    final responses = await Future.wait([
      _repositorypokemon.getPokemonInfo(pokemonId),
      _repositorypokemon.getPokemonSpeciesInfo(pokemonId)
    ]);

    final pokemonInfo = responses[0] as PokemonInfoResponse;
    final speciesInfo = responses[1] as PokemonSpeciesInfoResponse;

    emit(PokemonDetails(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        imageUrl: pokemonInfo.imageUrl,
        types: pokemonInfo.types,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        description: speciesInfo.description));
  }

  void clearPokemonDetails() => emit(null);
}