import 'package:expense_tracker/services/graph/pieChartSectionData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetsPieChart extends StatefulWidget {
  const WidgetsPieChart({super.key});

  @override
  State<WidgetsPieChart> createState() => _WidgetsPieChartState();
}

class _WidgetsPieChartState extends State<WidgetsPieChart> {
  int touchIndex = -1;

  List<List<dynamic>> data = [
    [10.toDouble(), 'this'],
    [20.toDouble(), 'is'],
    [30.toDouble(), 'a'],
    [40.toDouble(), 'dummy'],
    [50.toDouble(), 'data']
  ];

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: widgetsPieChartSelectionData(data, touchIndex),
        pieTouchData:
            PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                pieTouchResponse == null ||
                pieTouchResponse.touchedSection == null) {
              touchIndex = -1;
            } else {
              touchIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
            }
          });
        }),
        centerSpaceRadius: 3,
        sectionsSpace: 3,
      ),
      swapAnimationCurve: Curves.linear,
      swapAnimationDuration: const Duration(milliseconds: 150),
    );
  }
}
