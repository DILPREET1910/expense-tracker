import 'package:expense_tracker/pages/dataEntry.dart';
import 'package:flutter/material.dart';

//lib imports
import 'package:expense_tracker/widgets/drawer.dart';
import 'package:expense_tracker/widgets/appBar.dart';

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
        resizeToAvoidBottomInset: false,
        //prevents overflow error when keyboard pops up in mobile devices
        appBar: WidgetsAppBar(height: 50),
        backgroundColor: Colors.grey[400],
        drawer: const WidgetsDrawer(),
        body: const WidgetsDataEntry(),
      ),
    );
  }
}
