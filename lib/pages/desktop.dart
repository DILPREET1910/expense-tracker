import 'package:expense_tracker/widgets/appBar.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class Desktop extends StatefulWidget {
  const Desktop({Key? key}) : super(key: key);

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: WidgetsAppBar(height: 40),
            backgroundColor: Colors.blueGrey[100],
            body: WidgetsDrawer()));
  }
}
