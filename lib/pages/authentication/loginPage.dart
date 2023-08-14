import 'package:flutter/material.dart';

//lib imports
import 'package:expense_tracker/pages/authentication/forgotPasswordPage.dart';
import 'package:expense_tracker/widgets/textButton.dart';
import 'package:expense_tracker/widgets/textFormField.dart';

//firebase imports
import 'package:firebase_auth/firebase_auth.dart';

//google fonts imports
import 'package:google_fonts/google_fonts.dart';

//spinkit imports
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showSignInPage;

  const LoginPage({super.key, required this.showSignInPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //TextField controllers
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  //login function
  Future login() async {
    //show loading spinkit
    showDialog(
        context: context,
        builder: (context) {
          return const SpinKitCircle(
            color: Colors.grey,
          );
        });

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailTextController.text.trim(),
        password: _passwordTextController.text.trim());

    //pop spinkit
    Navigator.of(context).pop();
  }

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
                    "Welcome back! Login to start tracking your expenses",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
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
                //START: forgot password
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(
                            0, 0, MediaQuery.of(context).size.width / 6, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ForgotPasswordPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "forgot password",
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w200,
                                color: Colors.red.shade900),
                          ),
                        )),
                  ],
                ),
                //END: forgot password
                //START: login button
                const SizedBox(height: 2),
                WidgetsTextButton(
                  onPressed: login,
                  label: "Login",
                ),
                //END: login button
                //START: Not a user? Sign up
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not a user? ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: widget.showSignInPage,
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ),
                  ],
                )
                //END: Not a user? Sign up
              ],
            ),
          ),
        ),
      ),
    );
  }
}
