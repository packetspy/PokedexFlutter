// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokedexStore on _PokedexStore, Store {
  Computed<PokemonsModel> _$pokemonsApiComputed;

  @override
  PokemonsModel get pokemonsApi => (_$pokemonsApiComputed ??=
          Computed<PokemonsModel>(() => super.pokemonsApi))
      .value;

  final _$_pokemonsApiAtom = Atom(name: '_PokedexStore._pokemonsApi');

  @override
  PokemonsModel get _pokemonsApi {
    _$_pokemonsApiAtom.context.enforceReadPolicy(_$_pokemonsApiAtom);
    _$_pokemonsApiAtom.reportObserved();
    return super._pokemonsApi;
  }

  @override
  set _pokemonsApi(PokemonsModel value) {
    _$_pokemonsApiAtom.context.conditionallyRunInAction(() {
      super._pokemonsApi = value;
      _$_pokemonsApiAtom.reportChanged();
    }, _$_pokemonsApiAtom, name: '${_$_pokemonsApiAtom.name}_set');
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
