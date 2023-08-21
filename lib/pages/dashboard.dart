import 'package:expense_tracker/services/graph/pieChart.dart';
import 'package:expense_tracker/widgets/appBar.dart';
import 'package:flutter/material.dart';

class WidgetsDashBoard extends StatefulWidget {
  final bool appBar;

  const WidgetsDashBoard({super.key, required this.appBar});

  @override
  State<WidgetsDashBoard> createState() => _WidgetsDashBoardState();
}

class _WidgetsDashBoardState extends State<WidgetsDashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: widget.appBar ? WidgetsAppBar(height: 50) : WidgetsAppBar(height: 0),
        backgroundColor: Colors.grey[400],
        body: WidgetsPieChart(),
      ),
    );
  }
}
