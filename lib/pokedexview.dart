import 'package:flutter/material.dart';
import 'package:pokedex/StatePokemon.dart';
import 'package:pokedex/bloc_pokemon.dart';


class Pokedexview extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center (
          child : Text('Pokemon App'),
        ),
      ),
       body: BlocBuilder<PokemonBloc, StatePokemon>(
        builder: (context, state) {
          if (state is PokemonLoadProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonPageLoadSuccess) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: state.pokemonLists.length,
              itemBuilder: (context, index) {
                return Card(
                  child: GridTile(
                    child: Column(
                      children: [
                        Image.network(state.pokemonLists[index].imageUrl),
                        Text(state.pokemonLists[index].name)
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is PokemonPageLoadFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          
          }
        },
       ),

    );
  }
}
