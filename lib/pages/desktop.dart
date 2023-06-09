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
            appBar: WidgetsAppBar(height: 40),
            backgroundColor: Colors.grey[400],
            body: Row(
              children: [
                Expanded(flex: 1, child: WidgetsDrawer()),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: WidgetsDataAdderCard()),
                        Expanded(child: WidgetsDataEntriesCard())
                      ],
                    )),
              ],
            )));
  }
}
