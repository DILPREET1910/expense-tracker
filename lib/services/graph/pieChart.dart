import 'package:expense_tracker/services/graph/colors.dart';
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
    [20.toDouble(), 'data'],
    [50.toDouble(), 'this'],
    [10.toDouble(), 'is'],
    [10.toDouble(), 'more'],
    [50.toDouble(), 'dummy'],
    [50.toDouble(), 'data'],
    [50.toDouble(), 'to'],
    [50.toDouble(), 'check'],
    [50.toDouble(), 'color'],
    [50.toDouble(), 'scheme'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: PieChart(
          PieChartData(
            sections: widgetsPieChartSelectionData(data, touchIndex),
            pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchIndex = -1;
                } else {
                  touchIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                }
              });
            }),
            centerSpaceRadius: 0,
            sectionsSpace: 0,
          ),
          swapAnimationCurve: Curves.linear,
          swapAnimationDuration: const Duration(milliseconds: 150),
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Listener(
              onPointerDown: (value) {
                setState(() {
                  touchIndex = index;
                });
              },
              onPointerUp: (value) {
                setState(() {
                  touchIndex = -1;
                });
              },
              child: ListTile(
                leading: touchIndex == index
                    ? Icon(Icons.square_rounded, color: pieColorsFocus[index])
                    : Icon(Icons.circle, color: pieColors[index]),
                title: Text(
                  data[index][1],
                  style: touchIndex == index
                      ? GoogleFonts.ubuntu(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          color: Colors.black)
                      : GoogleFonts.ubuntu(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          color: Colors.black54),
                ),
                trailing: Text(
                  data[index][0].toString(),
                  style: touchIndex == index
                      ? GoogleFonts.ubuntu(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          color: Colors.black)
                      : GoogleFonts.ubuntu(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          color: Colors.black54),
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }
}
