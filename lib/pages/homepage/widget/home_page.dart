import 'package:flutter/material.dart';
import 'package:pokedex/shared/constants.dart';
import 'app_bar_home.dart';

class HomePage extends StatelessWidget {
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
                        child: ListView(
                      children: <Widget>[
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                        ListTile(title: Text('Lista de pokemons')),
                      ],
                    )),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
