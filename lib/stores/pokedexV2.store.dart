import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:pokedex/models/pokemon_api_v2.dart';
import 'package:pokedex/models/pokemon_specie_api_v2.dart';
import 'package:pokedex/shared/constants.dart';
part 'pokedexV2.store.g.dart';

class PokedexV2Store = _PokedexV2Store with _$PokedexV2Store;

abstract class _PokedexV2Store with Store {
  @observable
  PokemonApiV2 pokemonsApiV2;

  @observable
  PokemonSpecieApiV2 speciePokemon;

  @action
  Future<void> getInfoPokemon(String name) async {
    try {
      final response =
          await http.get(ConstantsApi.pokedexApiV2Url + name.toLowerCase());
      var decodeJson = jsonDecode(response.body);
      pokemonsApiV2 = PokemonApiV2.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista " + stacktrace.toString());
      return null;
    }
  }

  @action
  Future<void> getInfoSpecie(String numOfPokemon) async {
    try {
      speciePokemon = null;
      final response = await http
          .get(ConstantsApi.pokedexApiV2SpeciesUrl + numOfPokemon.toString());
      var decodeJson = jsonDecode(response.body);
      //speciePokemon = PokemonSpecieApiV2.fromJson(decodeJson);
      var _specie = PokemonSpecieApiV2.fromJson(decodeJson);
      speciePokemon = _specie;
    } catch (error, stacktrace) {
      print("Erro ao carregar lista " + stacktrace.toString());
      return null;
    }
  }
}
