import 'package:flutter/material.dart';
import 'package:pokedex/models/layout_type_model.dart';

class PokemonType extends StatelessWidget {
  final List<String> types;
  final LayoutType orientation;

  const PokemonType({Key key, this.types, this.orientation}) : super(key: key);

  Widget getTiposHorizontal(types) {
    List<Widget> listOfTypes = [];
    types.forEach((nome) {
      listOfTypes.add(
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(255, 255, 255, 0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  nome.trim(),
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            )
          ],
        ),
      );
    });
    return Row(
      children: listOfTypes,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget getTiposVertical(types) {
    List<Widget> listOfTypes = [];
    types.forEach((nome) {
      listOfTypes.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(255, 255, 255, 0.3),
              ),
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
      children: listOfTypes,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (orientation == LayoutType.horizontal) {
      return getTiposHorizontal(types);
    }
    return getTiposVertical(types);
  }
}
