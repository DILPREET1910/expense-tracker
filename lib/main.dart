import 'package:flutter/material.dart';

// lib imports
import 'package:expense_tracker/pages/responsive/responsiveLayout.dart';
import 'package:expense_tracker/pages/authentication/authPage.dart';

//firebase imports
import 'package:firebase_auth/firebase_auth.dart';
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
              home: ResponsiveLayout(),
            );
          } else {
            return const MaterialApp(
              home: AuthPage(),
            );
          }
        });
  }
}
