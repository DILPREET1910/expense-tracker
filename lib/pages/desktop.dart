import 'package:expense_tracker/pages/dashboard.dart';
import 'package:expense_tracker/pages/dataEntry.dart';
import 'package:expense_tracker/widgets/appBar.dart';
import 'package:expense_tracker/widgets/dataAdderCard.dart';
import 'package:expense_tracker/widgets/dataEntriesCard.dart';
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
            resizeToAvoidBottomInset: false,
            //prevents overflow error when keyboard pops up in mobile devices
            backgroundColor: Colors.grey[400],
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex: 1, child: WidgetsDrawer()),
                Expanded(flex: 2, child: WidgetsDataEntry()),
                Expanded(flex: 1, child: WidgetsDashBoard())
              ],
            )));
  }
}
