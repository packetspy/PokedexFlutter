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
  Computed<Pokemon> _$pokemonSelectedComputed;

  @override
  Pokemon get pokemonSelected => (_$pokemonSelectedComputed ??=
          Computed<Pokemon>(() => super.pokemonSelected))
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

  final _$_pokemonSelectedAtom = Atom(name: '_PokedexStore._pokemonSelected');

  @override
  Pokemon get _pokemonSelected {
    _$_pokemonSelectedAtom.context.enforceReadPolicy(_$_pokemonSelectedAtom);
    _$_pokemonSelectedAtom.reportObserved();
    return super._pokemonSelected;
  }

  @override
  set _pokemonSelected(Pokemon value) {
    _$_pokemonSelectedAtom.context.conditionallyRunInAction(() {
      super._pokemonSelected = value;
      _$_pokemonSelectedAtom.reportChanged();
    }, _$_pokemonSelectedAtom, name: '${_$_pokemonSelectedAtom.name}_set');
  }

  final _$colorPokemonSelectedAtom =
      Atom(name: '_PokedexStore.colorPokemonSelected');

  @override
  Color get colorPokemonSelected {
    _$colorPokemonSelectedAtom.context
        .enforceReadPolicy(_$colorPokemonSelectedAtom);
    _$colorPokemonSelectedAtom.reportObserved();
    return super.colorPokemonSelected;
  }

  @override
  set colorPokemonSelected(Color value) {
    _$colorPokemonSelectedAtom.context.conditionallyRunInAction(() {
      super.colorPokemonSelected = value;
      _$colorPokemonSelectedAtom.reportChanged();
    }, _$colorPokemonSelectedAtom,
        name: '${_$colorPokemonSelectedAtom.name}_set');
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
  dynamic setPokemonSelected({int index}) {
    final _$actionInfo = _$_PokedexStoreActionController.startAction();
    try {
      return super.setPokemonSelected(index: index);
    } finally {
      _$_PokedexStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({String numero}) {
    final _$actionInfo = _$_PokedexStoreActionController.startAction();
    try {
      return super.getImage(numero: numero);
    } finally {
      _$_PokedexStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'colorPokemonSelected: ${colorPokemonSelected.toString()},pokemonsApi: ${pokemonsApi.toString()},pokemonSelected: ${pokemonSelected.toString()}';
    return '{$string}';
  }
}
