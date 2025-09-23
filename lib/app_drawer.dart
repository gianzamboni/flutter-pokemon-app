import 'package:flutter/material.dart';

@immutable
class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Menú", style: Theme.of(context).textTheme.headlineMedium),
              DrawLink(
                label: "Inicio",
                icon: Icons.home,
                routeName: '/',
              ),
              DrawLink(
                label: "Nuevo Pokémon",
                icon: Icons.add,
                routeName: '/new-pokemon',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawLink extends StatelessWidget {
  const DrawLink({
    super.key,
    required this.label,
    required this.icon,
    required this.routeName,
  });

  final String label;
  final IconData icon;
  final String routeName;

  @override
  Widget build(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;

    return TextButton.icon(
      icon: Icon(icon, color:  colorScheme.onPrimaryContainer),
      label: Text(label, style: TextStyle(color: colorScheme.onPrimaryContainer, fontSize: 18)),
      onPressed: () {
        Navigator.of(context).pushNamed(routeName);
        Scaffold.of(context).closeDrawer();
      },
    );
  }
}