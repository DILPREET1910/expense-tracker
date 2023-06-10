import 'package:flutter/material.dart';

class WidgetsDashBoard extends StatefulWidget {
  const WidgetsDashBoard({super.key});

  @override
  State<WidgetsDashBoard> createState() => _WidgetsDashBoardState();
}

class _WidgetsDashBoardState extends State<WidgetsDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.grey[400], child: Text("DashBoard"));
  }
}
