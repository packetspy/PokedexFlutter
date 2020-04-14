import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/pages/home_page.dart';
import 'package:pokedex/stores/pokedex.store.dart';
import 'package:pokedex/stores/pokedexV2.store.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<PokedexStore>(PokedexStore());
  getIt.registerSingleton<PokedexV2Store>(PokedexV2Store());
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
