import 'package:flutter/material.dart';
import 'package:pokeapp/home_page.dart';
import 'package:pokeapp/themes/light_theme.dart';
import 'package:pokeapp/themes/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Poke App',
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      theme: lightTheme,  
      home: HomePage(title: "Poke App"),
    );
  }
}