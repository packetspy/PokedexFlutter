import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/models/pokemons_api.model.dart';
import 'package:pokedex/shared/constants.dart';
import 'package:pokedex/stores/pokedex.store.dart';
import 'app_bar_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokedexStore pokedexStore;
  @override
  void initState() {
    super.initState();
    pokedexStore = PokedexStore();
    pokedexStore.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    double sizePokeball = 240;
    double statusBarSize = MediaQuery.of(context).padding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          alignment: Alignment.topCenter,
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: -(sizePokeball / 4.7),
              left: screenWidth - (sizePokeball / 1.6),
              child: Opacity(
                child: Image.asset(
                  ConstantsImages.pokeballBlack,
                  height: sizePokeball,
                  width: sizePokeball,
                ),
                opacity: 0.1,
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: statusBarSize,
                  ),
                  AppBarHome(),
                  Expanded(
                    child: Container(
                      child: Observer(
                        builder: (BuildContext context) {
                          PokemonsModel _pokemon = pokedexStore.pokemonsApi;
                          return (pokedexStore.pokemonsApi != null)
                              ? ListView.builder(
                                  itemCount: _pokemon.pokemon.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(_pokemon.pokemon[index].name),
                                    );
                                  },
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
