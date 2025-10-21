import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/providers/user_session.dart';
import 'package:pokeapp/utils/DrawerLink.dart';
import 'package:pokeapp/utils/strings.dart';

@immutable
class AppDrawer extends ConsumerWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userSession = ref.read(userSessionProvider.notifier);
    final userSessionValue = ref.read(userSessionProvider).requireValue;
  
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(capitalizeFirstLetter(userSessionValue?.fullName ?? ""), style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer)),
                  DrawerLink(
                    label: "Home",
                    icon: Icons.home,
                    routeName: '/',
                  )
                ],
              ),
              DrawerLink(
                onPressed: () {
                  userSession.logout();
                },
                label: "Logout",
                icon: Icons.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
