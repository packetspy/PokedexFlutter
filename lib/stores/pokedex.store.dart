import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:pokedex/models/pokemons_api.model.dart';
import 'package:pokedex/shared/constants.dart';
import 'package:http/http.dart' as http;
part 'pokedex.store.g.dart';

class PokedexStore = _PokedexStore with _$PokedexStore;

abstract class _PokedexStore with Store {
  @observable
  PokemonsModel pokemonsApi;

  @action
  fetchPokemonList() {
    pokemonsApi = null;
    loadPokemons().then((pokemonsList) {
      pokemonsApi = pokemonsList;
    });
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
