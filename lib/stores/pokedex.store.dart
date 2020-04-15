import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/models/pokemons_api.model.dart';
import 'package:pokedex/shared/constants.dart';
import 'package:http/http.dart' as http;
part 'pokedex.store.g.dart';

class PokedexStore = _PokedexStore with _$PokedexStore;

abstract class _PokedexStore with Store {
  @observable
  PokemonsModel _pokemonsApi;

  @observable
  Pokemon _pokemonSelected;

  @observable
  Color pokemonSelectedColor;

  @observable
  int pokemonPosition;

  @computed
  PokemonsModel get pokemonsApi => _pokemonsApi;

  @computed
  Pokemon get pokemonSelected => _pokemonSelected;

  @action
  fetchPokemonList() {
    _pokemonsApi = null;
    loadPokemons().then((pokemonsList) {
      _pokemonsApi = pokemonsList;
    });
  }

  Pokemon getPokemon({int index}) {
    return _pokemonsApi.pokemon[index];
  }

  @action
  setPokemonSelected({int index}) {
    _pokemonSelected = _pokemonsApi.pokemon[index];
    pokemonSelectedColor =
        ConstantsColors.getColorType(type: _pokemonSelected.type[0]);
    pokemonPosition = index;
  }

  @action
  Widget getImage({String numero}) {
    return CachedNetworkImage(
      placeholder: (context, url) => new Container(
        color: Colors.transparent,
      ),
      imageUrl: "${ConstantsApi.pokemonImageUrl} / $numero.png",
    );
  }

  Future<PokemonsModel> loadPokemons() async {
    try {
      final response = await http.get(ConstantsApi.pokedexApiUrl);
      var decodeJson = jsonDecode(response.body);
      return PokemonsModel.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista " + stacktrace.toString());
      return null;
    }
  }
}
