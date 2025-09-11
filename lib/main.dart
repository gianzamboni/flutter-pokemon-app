import 'package:flutter/material.dart';
import 'package:pokeapp/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var textTheme = TextTheme(
      headlineMedium: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold, shadows: [
        Shadow(color: Colors.black, blurRadius: 5)
      ]),
      headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)
    );
    
    return MaterialApp(
      title: 'Poke App',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: Colors.red.shade900,
          surface: Colors.grey.shade900

        ),
        textTheme: textTheme
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: Colors.red,
          surface: Colors.grey.shade100
          ),
        textTheme: textTheme
      ),
      home: HomePage(title: "Poke App"),
    );
  }
}