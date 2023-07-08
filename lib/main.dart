import 'package:expense_tracker/pages/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import lib/pages
import 'package:expense_tracker/responsive/mobile.dart';
import 'package:expense_tracker/responsive/tablet.dart';
import 'package:expense_tracker/responsive/desktop.dart';
import 'package:expense_tracker/responsive/responsive_layout.dart';

//firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //initialise firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              home: ResponsiveLayout(
                mobile: Mobile(),
                tablet: Tablet(),
                desktop: Desktop(),
              ),
            );
          } else {
            return MaterialApp(
              home: LoginPage(),
            );
          }
        });
  }
}
