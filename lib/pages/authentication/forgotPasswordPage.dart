import 'package:flutter/material.dart';

//lib imports
import 'package:expense_tracker/widgets/textButton.dart';
import 'package:expense_tracker/widgets/textFormField.dart';

//google fonts imports
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  //TextField controllers
  final TextEditingController _emailTextController = TextEditingController();

  //send email function
  Future sendEmail() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
        ),
        backgroundColor: Colors.grey[400],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //START: Forgot password title and text
                Text(
                  'Forgot Password',
                  style: GoogleFonts.balooBhai2(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      letterSpacing: 1,
                      wordSpacing: 5,
                      fontSize: 45),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    "Enter your email and we will send you a link to reset your password",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.balooBhai2(
                      fontSize: 18,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                //END: Forgot password title and text
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
                //START: send email button
                const SizedBox(height: 10),
                WidgetsTextButton(
                  onPressed: sendEmail,
                  label: "Send email",
                ),
                //END: send email button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
