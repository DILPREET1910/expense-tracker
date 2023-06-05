import 'package:flutter/material.dart';

class WidgetsDrawer extends StatefulWidget {
  const WidgetsDrawer({Key? key}) : super(key: key);

  @override
  State<WidgetsDrawer> createState() => _WidgetsDrawerState();
}

class _WidgetsDrawerState extends State<WidgetsDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
    );
  }
}
