import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/models/user_session.dart';
import 'package:pokeapp/providers/user_session.dart';

class SecuredScreen extends ConsumerStatefulWidget {
  const SecuredScreen({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<SecuredScreen> createState() => _SecuredScreenState();
}

class _SecuredScreenState extends ConsumerState<SecuredScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _redirectIfNotAuthenticated();
    });
    
  }

  @override
  Widget build(BuildContext context) {

    ref.listen(userAuthStateProvider, (previous, next) {
      _redirectIfNotAuthenticated();
    });

    final isAuth = ref.watch(userAuthStateProvider);
    return isAuth == UserSessionState.authenticated ? widget.child : const SizedBox.shrink();
  }

  _redirectIfNotAuthenticated() {
    final isAuth = ref.read(userAuthStateProvider);
    if(isAuth == UserSessionState.anonymous || isAuth == UserSessionState.error) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }
}