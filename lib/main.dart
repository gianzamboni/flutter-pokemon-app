import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/screens/home/home_page.dart';
import 'package:pokeapp/screens/new_pokemon/new_pokemon_form.dart';
import 'package:pokeapp/themes/light_theme.dart';
import 'package:pokeapp/themes/dark_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke App',  
      routes: {
        '/' : (context) => HomePage(),
        '/new-pokemon': (context) => NewPokemonForm(),
      },
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      theme: lightTheme,  
    );
  }
}