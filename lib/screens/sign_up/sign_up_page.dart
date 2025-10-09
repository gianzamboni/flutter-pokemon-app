import 'package:flutter/material.dart';
import 'package:pokeapp/app_bar_title.dart';
import 'package:pokeapp/screens/sign_up/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pokeAppBar("Sign Up", context, showIcon: false),
      body: SignUpForm(),
    );
  }
}
 