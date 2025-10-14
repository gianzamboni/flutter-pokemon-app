
import 'package:flutter/material.dart';

class DrawerLink extends StatelessWidget {
  const DrawerLink({
    super.key,
    required this.label,
    this.icon,
    this.routeName,
    this.onPressed,
    this.color,
  });

  final String label;
  final IconData? icon;
  final String? routeName;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {

  if (routeName != null && onPressed != null) {
    throw Exception('routeName and onPressed cannot be used together');
  }

  final colorScheme = Theme.of(context).colorScheme;

  return TextButton.icon(
    icon: icon != null ? Icon(icon, color:  color ?? colorScheme.onPrimaryContainer) : null,
    label: Text(label, style: TextStyle(color: color ?? colorScheme.onPrimaryContainer, fontSize: 18)),
    onPressed: () {
      if (routeName != null) {
        Navigator.of(context).pushNamed(routeName!);
      } else {
        onPressed?.call();
      }
      Scaffold.of(context).closeDrawer();
    },
  );
}
}