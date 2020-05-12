import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex/models/pokemon_api_v2.dart';
import 'package:pokedex/models/pokemons_api.model.dart';
import 'package:pokedex/stores/pokedex.store.dart';
import 'package:pokedex/stores/pokedexV2.store.dart';
import 'package:pokedex/shared/hexcolor.dart';
import 'package:pokedex/shared/string_extension.dart';

class TabStatus extends StatelessWidget {
  final PokedexV2Store _pokeApiV2Store = GetIt.instance<PokedexV2Store>();
  final PokedexStore _pokeApiStore = GetIt.instance<PokedexStore>();

  double percentageCalculate(int valueStat) {
    double percentage = valueStat / 100;
    if (percentage <= 0.0) {
      percentage = 0;
    }
    if (percentage >= 1.0) {
      percentage = 1.0;
    }
    return percentage;
  }

  Color applyColor(int value) {
    //TODO: Melhorar cores conforme as porcentagens
    if (value <= 30) {
      return HexColor("d8ebb5");
    } else if (value <= 50) {
      return HexColor("d9bf77");
    } else if (value <= 80) {
      return HexColor("639a67");
    } else {
      return HexColor("2b580c");
    }
  }

  Widget singleStatusBar(String labelStat, int valueStat) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${labelStat.capitalize()}: ",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              valueStat.toString(),
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new LinearPercentIndicator(
              width: 200.0,
              lineHeight: 9.0,
              percent: percentageCalculate(valueStat),
              progressColor: applyColor(valueStat),
            )
          ],
        ),
      ],
    );
  }

  List<Widget> listOfStatus(Pokemon pokemon) {
    List<Stats> statsPokenon = _pokeApiV2Store.pokemonsApiV2.stats;
    List<Widget> lineStats = [];

    statsPokenon.forEach((element) {
      lineStats.add(singleStatusBar(element.stat.name, element.baseStat));
      lineStats.add(SizedBox(
        height: 20,
      ));
    });

    return lineStats;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Observer(builder: (context) {
          Pokemon pokemon = _pokeApiStore.pokemonSelected;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: listOfStatus(pokemon),
            ),
          );
        }),
      ),
    );
  }
}
