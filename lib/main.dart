import 'package:pokedex/bloc/bloc_pokemon.dart';
import 'package:pokedex/bloc/EventPokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context)
          .copyWith(primaryColor: Colors.red, accentColor: Colors.redAccent),
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0)))
      ], child: PokedexView()),
    );
  }
}