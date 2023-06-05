import 'package:flutter/material.dart';

// import lib/pages
import 'package:expense_tracker/pages/mobile.dart';
import 'package:expense_tracker/pages/tablet.dart';
import 'package:expense_tracker/pages/desktop.dart';
import 'package:expense_tracker/pages/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveLayout(
        mobile: Mobile(),
        tablet: Tablet(),
        desktop: Desktop(),
      ),
    );
  }
}
