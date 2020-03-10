import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  Widget setTipos() {
    List<Widget> lista = [];
    types.forEach((nome) {
      lista.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(80, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  nome.trim(),
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      );
    });
    return Column(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

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
                  child: setTipos(),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Opacity(
                child: Image.asset(
                  ConstantsImages.pokeballWhite,
                  height: 80,
                  width: 80,
                ),
                opacity: 0.2,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: CachedNetworkImage(
                height: 120,
                width: 120,
                placeholder: (context, url) => new Container(
                  color: Colors.transparent,
                ),
                imageUrl:
                    'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$number.png',
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: ConstantsImages.getColorType(type: types[0]),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
