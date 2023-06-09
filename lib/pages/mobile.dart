import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/drawer.dart';

import '../widgets/appBar.dart';

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: WidgetsAppBar(height: 50),
            backgroundColor: Colors.blueGrey[100],
            drawer: WidgetsDrawer()));
  }
}
