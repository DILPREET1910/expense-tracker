import 'package:expense_tracker/widgets/appBar.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../pages/dataEntry.dart';

class Tablet extends StatefulWidget {
  const Tablet({Key? key}) : super(key: key);

  @override
  State<Tablet> createState() => _TabletState();
}

class _TabletState extends State<Tablet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            //prevents overflow error when keyboard pops up in mobile devices
            appBar: WidgetsAppBar(height: 50),
            backgroundColor: Colors.grey[400],
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex: 1, child: WidgetsDrawer()),
                Expanded(flex: 2, child: WidgetsDataEntry()),
              ],
            )));
  }
}
