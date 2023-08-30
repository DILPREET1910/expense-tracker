import 'package:flutter/material.dart';

//lib imports
import 'package:expense_tracker/pages/authentication/loginPage.dart';
import 'package:expense_tracker/pages/authentication/signupPage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //initially show login page
  bool showLoginPage = true;

  void toggleLoginSignIn() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showSignInPage: toggleLoginSignIn);
    } else {
      return SignUpPage(showLoginPage: toggleLoginSignIn);
    }
  }
}
