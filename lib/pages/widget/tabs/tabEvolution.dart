import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/models/pokemons_api.model.dart';
import 'package:pokedex/stores/pokedex.store.dart';

class TabEvolution extends StatelessWidget {
  final PokedexStore _pokeApiStore = GetIt.instance<PokedexStore>();

  Widget resizePokemon(Widget widget) {
    return SizedBox(
      height: 80,
      width: 80,
      child: widget,
    );
  }

  List<Widget> getEvolution(Pokemon pokemon) {
    List<Widget> _listEvolutions = [];
    if (pokemon.prevEvolution != null) {
      pokemon.prevEvolution.forEach((p) {
        _listEvolutions
            .add(resizePokemon(_pokeApiStore.getImage(numero: p.num)));
        _listEvolutions.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              p.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        _listEvolutions.add(Icon(Icons.keyboard_arrow_down));
      });
    }

    _listEvolutions
        .add(resizePokemon(_pokeApiStore.getImage(numero: pokemon.num)));
    _listEvolutions.add(
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Text(
          pokemon.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    if (pokemon.nextEvolution != null) {
      pokemon.nextEvolution.forEach((n) {
        _listEvolutions.add(Icon(Icons.keyboard_arrow_down));
        _listEvolutions
            .add(resizePokemon(_pokeApiStore.getImage(numero: n.num)));
        _listEvolutions.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              n.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      });
    }

    return _listEvolutions;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Observer(builder: (context) {
          Pokemon pokemon = _pokeApiStore.pokemonSelected;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: getEvolution(pokemon),
            ),
          );
        }),
      ),
    );
  }
}
