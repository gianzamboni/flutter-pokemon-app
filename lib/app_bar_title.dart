import 'package:flutter/material.dart';

AppBar pokeAppBar(String title, BuildContext context, {bool showIcon = true}) {
  
  final icon = showIcon ? [
    SizedBox(
        height: 24,
        child: Image.asset("assets/img/poke_ball.png")
      ),
      SizedBox(width: 8),
  ] : [];

  return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
        ...icon,
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
      ]),
    );
}