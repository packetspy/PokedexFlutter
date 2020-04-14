import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokedex/models/layout_type_model.dart';
import 'package:pokedex/pages/widget/pokemon_type.dart';
import 'package:pokedex/shared/constants.dart';

class PokemonItem extends StatelessWidget {
  final int index;
  final String name;
  final String number;
  final Color color;
  final List<String> types;

  const PokemonItem(
      {Key key, this.index, this.name, this.color, this.types, this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Text(
                    name,
                    style: TextStyle(
                        fontFamily: 'Google',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PokemonType(
                    types: types,
                    orientation: LayoutType.vertical,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Hero(
                tag: name + 'rotation',
                child: Opacity(
                  child: Image.asset(
                    ConstantsImages.pokeballWhite,
                    height: 80,
                    width: 80,
                  ),
                  opacity: 0.2,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Hero(
                tag: name,
                child: CachedNetworkImage(
                  alignment: Alignment.bottomRight,
                  height: 120,
                  width: 120,
                  placeholder: (context, url) => new Container(
                    color: Colors.transparent,
                  ),
                  imageUrl:
                      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$number.png',
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ConstantsColors.getColorType(type: types[0]),
                ConstantsColors.getColorType(type: types[0]).withOpacity(0.7)
              ]),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
