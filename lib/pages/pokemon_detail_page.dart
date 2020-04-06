import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/models/pokemons_api.model.dart';
import 'package:pokedex/shared/constants.dart';
import 'package:pokedex/stores/pokedex.store.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
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
  MultiTrackTween _animation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.index);
    _pokedexStore = GetIt.instance<PokedexStore>();
    _pokemonSelected = _pokedexStore.getPokemonSelected;
    _animation = MultiTrackTween([
      Track('rotateTheBall').add(
          Duration(seconds: 7), Tween(begin: 0.0, end: 1.0),
          curve: Curves.linear)
    ]);
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
            padding: EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 250,
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
                        ControlledAnimation(
                          playback: Playback.LOOP,
                          duration: _animation.duration,
                          tween: _animation,
                          builder: (context, animation) {
                            return Transform.rotate(
                              alignment: FractionalOffset.center,
                              angle: animation['rotateTheBall'] * 6.3,
                              child: Hero(
                                tag: count.toString(),
                                child: Opacity(
                                  child: Image.asset(
                                    ConstantsImages.pokeballBlack,
                                    height: 400,
                                    width: 400,
                                  ),
                                  opacity: 0.1,
                                ),
                              ),
                            );
                          },
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
