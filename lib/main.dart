import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/screens/home/home_page.dart';
import 'package:pokeapp/screens/login/login_page.dart';
import 'package:pokeapp/screens/new_pokemon/new_pokemon_page.dart';
import 'package:pokeapp/screens/sign_up/sign_up_page.dart';
import 'package:pokeapp/secured_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke App',
      routes: {
        '/': (context) => SecuredScreen(child: HomePage()),
        '/new-pokemon': (context) => SecuredScreen(child: NewPokemonPage()),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
      },
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      theme: lightTheme,
    );
  }
}
