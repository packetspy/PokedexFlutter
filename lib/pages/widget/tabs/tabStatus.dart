import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/components/circular_progress_pokemon.dart';
import 'package:pokedex/models/pokemon_specie_api_v2.dart';
import 'package:pokedex/stores/pokedex.store.dart';
import 'package:pokedex/stores/pokedexV2.store.dart';

class TabStatus extends StatelessWidget {
  final PokedexV2Store _pokeApiV2Store = GetIt.instance<PokedexV2Store>();
  final PokedexStore _pokeApiStore = GetIt.instance<PokedexStore>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[],
        ),
      ),
    );
  }
}
