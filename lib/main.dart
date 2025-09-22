import 'package:flutter/material.dart';
import 'package:pokeapp/screens/home_page.dart';
import 'package:pokeapp/screens/new_pokemon.dart';
import 'package:pokeapp/themes/light_theme.dart';
import 'package:pokeapp/themes/dark_theme.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke App',
      routes: {
        '/' : (context) => HomePage(title: "Poke App"),
        '/new-pokemon': (context) => NewPokemon(),
      },
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      theme: lightTheme,  
    );
  }
}