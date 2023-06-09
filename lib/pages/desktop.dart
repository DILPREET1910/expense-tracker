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
          appBar: AppBar(
            backgroundColor: Colors.grey[900],
          ),
          backgroundColor: Colors.blueGrey[100],
          body: WidgetsDrawer(),
        ));
  }
}
