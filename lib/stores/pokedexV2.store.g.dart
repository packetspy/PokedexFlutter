// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedexV2.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokedexV2Store on _PokedexV2Store, Store {
  final _$pokemonsApiV2Atom = Atom(name: '_PokedexV2Store.pokemonsApiV2');

  @override
  PokemonApiV2 get pokemonsApiV2 {
    _$pokemonsApiV2Atom.context.enforceReadPolicy(_$pokemonsApiV2Atom);
    _$pokemonsApiV2Atom.reportObserved();
    return super.pokemonsApiV2;
  }

  @override
  set pokemonsApiV2(PokemonApiV2 value) {
    _$pokemonsApiV2Atom.context.conditionallyRunInAction(() {
      super.pokemonsApiV2 = value;
      _$pokemonsApiV2Atom.reportChanged();
    }, _$pokemonsApiV2Atom, name: '${_$pokemonsApiV2Atom.name}_set');
  }

  final _$speciePokemonAtom = Atom(name: '_PokedexV2Store.speciePokemon');

  @override
  PokemonSpecieApiV2 get speciePokemon {
    _$speciePokemonAtom.context.enforceReadPolicy(_$speciePokemonAtom);
    _$speciePokemonAtom.reportObserved();
    return super.speciePokemon;
  }

  @override
  set speciePokemon(PokemonSpecieApiV2 value) {
    _$speciePokemonAtom.context.conditionallyRunInAction(() {
      super.speciePokemon = value;
      _$speciePokemonAtom.reportChanged();
    }, _$speciePokemonAtom, name: '${_$speciePokemonAtom.name}_set');
  }

  final _$getInfoPokemonAsyncAction = AsyncAction('getInfoPokemon');

  @override
  Future<void> getInfoPokemon(String name) {
    return _$getInfoPokemonAsyncAction.run(() => super.getInfoPokemon(name));
  }

  final _$getInfoSpecieAsyncAction = AsyncAction('getInfoSpecie');

  @override
  Future<void> getInfoSpecie(String numOfPokemon) {
    return _$getInfoSpecieAsyncAction
        .run(() => super.getInfoSpecie(numOfPokemon));
  }

  @override
  String toString() {
    final string =
        'pokemonsApiV2: ${pokemonsApiV2.toString()},speciePokemon: ${speciePokemon.toString()}';
    return '{$string}';
  }
}
