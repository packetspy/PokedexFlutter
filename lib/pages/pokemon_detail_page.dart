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
  double _progress;
  double _multiple;
  double _opacity;
  double _opacityTitleAppBar;
  int _transitionBackround;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: widget.index, viewportFraction: 0.75);
    _pokedexStore = GetIt.instance<PokedexStore>();
    _pokemonSelected = _pokedexStore.getPokemonSelected;
    _animation = MultiTrackTween([
      Track('rotateTheBall').add(
          Duration(seconds: 7), Tween(begin: 0.0, end: 1.0),
          curve: Curves.linear)
    ]);
    _progress = 0;
    _multiple = 1;
    _opacity = 1;
    _opacityTitleAppBar = 0;
    _transitionBackround = 300;
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Observer(builder: (BuildContext context) {
          return AnimatedContainer(
            duration: Duration(milliseconds: _transitionBackround),
            color: _pokedexStore.colorPokemonSelected,
            child: AppBar(
              title: Opacity(
                child: Text(
                  _pokemonSelected.name,
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                opacity: _opacityTitleAppBar,
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
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
            ),
          );
        }),
      ),
      body: Stack(
        children: <Widget>[
          Observer(
            builder: (context) {
              return AnimatedContainer(
                color: _pokedexStore.colorPokemonSelected,
                duration: Duration(milliseconds: _transitionBackround),
              );
            },
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
          ),
          SlidingSheet(
            listener: (state) {
              setState(() {
                _progress = state.progress;
                _multiple = 1 - interval(0.0, 0.9, _progress);
                _opacity = _multiple;
                _opacityTitleAppBar =
                    _multiple = interval(0.55, 0.8, _progress);
              });
            },
            elevation: 0,
            cornerRadius: 30,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.7, 0.95],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
              );
            },
          ),
          Opacity(
            opacity: _opacity,
            child: Padding(
              padding: EdgeInsets.only(
                  top: _opacityTitleAppBar == 1
                      ? 10000
                      : (MediaQuery.of(context).size.height * 0.025) -
                          _progress * 10),
              child: SizedBox(
                height: 250,
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      _pokedexStore.setPokemonSelected(index: index);
                    },
                    itemCount: _pokedexStore.pokemonsApi.pokemon.length,
                    itemBuilder: (BuildContext context, int index) {
                      Pokemon _pokemonItem =
                          _pokedexStore.getPokemon(index: index);
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
                                  tag: _pokemonItem.name + 'rotation',
                                  child: Opacity(
                                    child: Image.asset(
                                      ConstantsImages.pokeballWhite,
                                      height: 400,
                                      width: 400,
                                    ),
                                    opacity: 0.1,
                                  ),
                                ),
                              );
                            },
                          ),
                          Observer(builder: (context) {
                            return AnimatedPadding(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeInOutCubic,
                              padding: EdgeInsets.all(
                                  index == _pokedexStore.pokemonPosition
                                      ? 0
                                      : 60),
                              child: Hero(
                                tag: _pokemonItem.name,
                                child: CachedNetworkImage(
                                  height: 160,
                                  width: 160,
                                  placeholder: (context, url) => new Container(
                                    color: Colors.transparent,
                                  ),
                                  color: index == _pokedexStore.pokemonPosition
                                      ? null
                                      : Colors.black.withOpacity(0.5),
                                  imageUrl:
                                      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${_pokemonItem.num}.png',
                                ),
                              ),
                            );
                          }),
                        ],
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
