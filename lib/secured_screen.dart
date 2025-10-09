import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/providers/user_session.dart';
import 'package:pokeapp/screens/login/login_page.dart';

class SecuredScreen extends ConsumerWidget {
  const SecuredScreen({super.key, required this.child,});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userIsAuthenticated = ref.watch(userIsAuthenticatedProvider);

    if (!userIsAuthenticated) {
      return LoginPage();
    }

    return child;
  }
}