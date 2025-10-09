
import 'package:flutter/material.dart';

class DrawLink extends StatelessWidget {
  const DrawLink({
    super.key,
    required this.label,
    this.icon,
    required this.routeName,
    this.color,
  });

  final String label;
  final IconData? icon;
  final String routeName;
  final Color? color;

  @override
  Widget build(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;

    return TextButton.icon(
      icon: icon != null ? Icon(icon, color:  color ?? colorScheme.onPrimaryContainer) : null,
      label: Text(label, style: TextStyle(color: color ?? colorScheme.onPrimaryContainer, fontSize: 18)),
      onPressed: () {
        Navigator.of(context).pushNamed(routeName);
        Scaffold.of(context).closeDrawer();
      },
    );
  }
}