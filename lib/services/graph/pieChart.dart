import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WidgetsPieChart extends StatefulWidget {
  const WidgetsPieChart({super.key});

  @override
  State<WidgetsPieChart> createState() => _WidgetsPieChartState();
}

class _WidgetsPieChartState extends State<WidgetsPieChart> {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        centerSpaceRadius: 0,
        sectionsSpace: 0,
      ),
      swapAnimationCurve: Curves.linear,
      swapAnimationDuration: const Duration(milliseconds: 150),
    );
  }
}
