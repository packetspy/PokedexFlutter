import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/models/pokemons_api.model.dart';
import 'package:pokedex/shared/constants.dart';
import 'package:pokedex/stores/pokedex.store.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokemonDetailPage extends StatefulWidget {
  final int index;

  PokemonDetailPage({Key key, this.index}) : super(key: key);

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  PageController _pageController;
  PokedexStore _pokedexStore;
  Pokemon _pokemonSelected;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.index);
    _pokedexStore = GetIt.instance<PokedexStore>();
    _pokemonSelected = _pokedexStore.getPokemonSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Observer(builder: (BuildContext context) {
          return AppBar(
            title: Opacity(
              child: Text(
                _pokemonSelected.name,
                style: TextStyle(
                    fontFamily: 'Google',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              opacity: 0,
            ),
            elevation: 0,
            backgroundColor: _pokedexStore.colorPokemonSelected,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              )
            ],
          );
        }),
      ),
      body: Stack(
        children: <Widget>[
          Observer(
            builder: (context) {
              return Container(
                color: _pokedexStore.colorPokemonSelected,
              );
            },
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
          ),
          SlidingSheet(
            elevation: 0,
            cornerRadius: 30,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.7, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: SizedBox(
              height: 200,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    _pokedexStore.setPokemonSelected(index: index);
                  },
                  itemCount: _pokedexStore.pokemonsApi.pokemon.length,
                  itemBuilder: (BuildContext context, int count) {
                    Pokemon _pokemonItem =
                        _pokedexStore.getPokemon(index: count);
                    return Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Hero(
                          tag: count.toString(),
                          child: Opacity(
                            child: Image.asset(
                              ConstantsImages.pokeballWhite,
                              height: 400,
                              width: 400,
                            ),
                            opacity: 0.2,
                          ),
                        ),
                        CachedNetworkImage(
                          height: 160,
                          width: 160,
                          placeholder: (context, url) => new Container(
                            color: Colors.transparent,
                          ),
                          imageUrl:
                              'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${_pokemonItem.num}.png',
                        ),
                      ],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
