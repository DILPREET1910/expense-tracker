//import pages
import 'package:expense_tracker/api/Google%20Sheets/user_sheet_api.dart';
import 'package:expense_tracker/pages/Data.dart';
import 'package:expense_tracker/pages/Dashboard.dart';
import 'package:expense_tracker/pages/Settings.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Data(),
      '/dashboard': (context) => Dashboard(),
      '/settings': (context) => Settings(),
    },
  ));
}
