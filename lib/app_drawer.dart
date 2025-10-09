import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/utils/DrawLink.dart';

@immutable
class AppDrawer extends ConsumerWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  DrawLink(
                    label: "Home",
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
            ],
          ),
        ),
      ),
    );
  }
}
