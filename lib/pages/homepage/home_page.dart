import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/models/pokemons_api.model.dart';
import 'package:pokedex/pages/homepage/widget/app_bar_home.dart';
import 'package:pokedex/pages/homepage/widget/pokemon_item.dart';
import 'package:pokedex/shared/constants.dart';
import 'package:pokedex/stores/pokedex.store.dart';

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
    //PokemonsModel _pokemon = pokedexStore.pokemonsApi;
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
                        name: 'ListaHomePage',
                        builder: (BuildContext context) {
                          return (pokedexStore.pokemonsApi != null)
                              ? AnimationLimiter(
                                  child: GridView.builder(
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.all(12),
                                      addAutomaticKeepAlives: true,
                                      gridDelegate:
                                          new SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      itemCount: pokedexStore
                                          .pokemonsApi.pokemon.length,
                                      itemBuilder: (context, index) {
                                        Pokemon pokemon = pokedexStore
                                            .getPokemon(index: index);
                                        return AnimationConfiguration
                                            .staggeredGrid(
                                                position: index,
                                                columnCount: 2,
                                                duration: const Duration(
                                                    milliseconds: 375),
                                                child: ScaleAnimation(
                                                    child: GestureDetector(
                                                  child: PokemonItem(
                                                    types: pokemon.type,
                                                    index: index,
                                                    name: pokemon.name,
                                                    number: pokemon.num,
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                Container() /*PokeDetailPage(index: index)*/,
                                                            fullscreenDialog:
                                                                true));
                                                  },
                                                )));
                                      }),
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
