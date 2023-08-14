import 'package:flutter/material.dart';

//lib imports
import 'package:expense_tracker/widgets/textButton.dart';
import 'package:expense_tracker/widgets/textFormField.dart';

//firebase imports
import 'package:firebase_auth/firebase_auth.dart';

//google fonts imports
import 'package:google_fonts/google_fonts.dart';

//spinkit imports
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const SignUpPage({super.key, required this.showLoginPage});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //TextField controllers
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();

  //START : Sign Up function
  Future signup() async {
    if (confirmPassword()) {
      //show loading spinkit
      showDialog(
          context: context,
          builder: (context) {
            return const SpinKitCircle(
              color: Colors.grey,
            );
          });

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailTextController.text.trim(),
          password: _passwordTextController.text.trim());

      //pop spinkit
      Navigator.of(context).pop();
    }
  }

  bool confirmPassword() {
    if (_passwordTextController.text.trim() ==
        _confirmPasswordTextController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  //END: Sign Up function

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
                //START: Sign Up and welcome text
                Text(
                  'Sign Up',
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      letterSpacing: 3,
                      wordSpacing: 5,
                      fontSize: 50),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    "Create an account to start tracking your expenses",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      fontSize: 18,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                //END: Sign Up and welcome text
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
                const SizedBox(height: 10),
                WidgetsTextFormFields(
                    label: "password",
                    icon: const Icon(
                      Icons.lock_open_outlined,
                      color: Colors.black,
                    ),
                    obscure: true,
                    controller: _passwordTextController),
                //END: password input
                //START: confirm password input
                const SizedBox(height: 10),
                WidgetsTextFormFields(
                    label: "confirm password",
                    icon: const Icon(
                      Icons.lock_outline,
                      color: Colors.black,
                    ),
                    obscure: true,
                    controller: _confirmPasswordTextController),
                //END: confirm password input
                //START: Sign Up button
                const SizedBox(height: 10),
                WidgetsTextButton(
                  onPressed: signup,
                  label: "Sign Up",
                ),
                //END: Sign Up button
                //START: Already as user? Login
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already a user? ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ),
                  ],
                )
                //END: Already a user? Login
              ],
            ),
          ),
        ),
      ),
    );
  }
}
