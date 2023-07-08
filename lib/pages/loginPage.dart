import 'package:expense_tracker/widgets/textButton.dart';
import 'package:expense_tracker/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //TextField controllers
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //START: Login and welcome text
                Text(
                  'Log In',
                  style: GoogleFonts.balooBhai2(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      letterSpacing: 3,
                      wordSpacing: 5,
                      fontSize: 50),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    "Welcome back! Login to start tracking our expenses",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.balooBhai2(
                      fontSize: 18,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                //END: Login and welcome text
                //START: email input
                const SizedBox(height: 50),
                WidgetsTextFormFields(
                    label: "email",
                    icon: const Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    ),
                    controller: _emailTextController),
                //END: email input
                //START: password input
                const SizedBox(height: 15),
                WidgetsTextFormFields(
                    label: "password",
                    icon: const Icon(
                      Icons.lock_outline,
                      color: Colors.black,
                    ),
                    obscure: true,
                    controller: _passwordTextController),
                //END: password input
                //START: login button
                const SizedBox(height: 15),
                WidgetsTextButton(
                  onPressed: () {},
                  label: "Login",
                ),
                //END: login button
                //START: Not a user? Sign in
                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a user? ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      "Register now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ],
                )
                //END: Not a user? Sign in
              ],
            ),
          ),
        ),
      ),
    );
  }
}
