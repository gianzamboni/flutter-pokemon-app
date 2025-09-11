import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      SizedBox(
        height: 24,
        child: Image.asset("assets/img/poke_ball.png")
      ),
      SizedBox(width: 8),
      Text(title, style: Theme.of(context).textTheme.headlineMedium),
    ]);
  }
}