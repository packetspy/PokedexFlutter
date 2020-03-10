// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokedexStore on _PokedexStore, Store {
  final _$pokemonsApiAtom = Atom(name: '_PokedexStore.pokemonsApi');

  @override
  PokemonsModel get pokemonsApi {
    _$pokemonsApiAtom.context.enforceReadPolicy(_$pokemonsApiAtom);
    _$pokemonsApiAtom.reportObserved();
    return super.pokemonsApi;
  }

  @override
  set pokemonsApi(PokemonsModel value) {
    _$pokemonsApiAtom.context.conditionallyRunInAction(() {
      super.pokemonsApi = value;
      _$pokemonsApiAtom.reportChanged();
    }, _$pokemonsApiAtom, name: '${_$pokemonsApiAtom.name}_set');
  }

  final _$_PokedexStoreActionController =
      ActionController(name: '_PokedexStore');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokedexStoreActionController.startAction();
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokedexStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'pokemonsApi: ${pokemonsApi.toString()}';
    return '{$string}';
  }
}
