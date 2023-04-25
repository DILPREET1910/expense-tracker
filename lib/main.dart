//import pages
import 'package:expense_tracker/pages/Dashboard.dart';
import 'package:expense_tracker/pages/Settings.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Dashboard(),
      '/settings': (context) => Settings(),
    },
  ));
}
