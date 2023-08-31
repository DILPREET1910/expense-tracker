import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//lib imports
import 'package:expense_tracker/services/graph/colors.dart';
import 'package:expense_tracker/services/graph/pieChartSectionData.dart';

//google fonts imports
import 'package:google_fonts/google_fonts.dart';

//fl charts imports
import 'package:fl_chart/fl_chart.dart';

class WidgetsPieChart extends StatefulWidget {
  final List<String> data;

  const WidgetsPieChart({super.key, required this.data});

  @override
  State<WidgetsPieChart> createState() => _WidgetsPieChartState();
}

class _WidgetsPieChartState extends State<WidgetsPieChart> {
  int touchIndex = -1;

  //date time variables
  DateTime startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime endDate = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  //datePicker functions
  void startDatePicker() {
    showDatePicker(
      builder: (context, child) {
        return Theme(
            data: ThemeData().copyWith(
                colorScheme: ColorScheme.light(primary: Colors.grey[900]!),
                dialogBackgroundColor: Colors.grey),
            child: child!);
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2900),
    ).then((value) {
      setState(() {
        startDate = value!;
      });
    });
  }

  void endDatePicker() {
    showDatePicker(
      builder: (context, child) {
        return Theme(
            data: ThemeData().copyWith(
                colorScheme: ColorScheme.light(primary: Colors.grey[900]!),
                dialogBackgroundColor: Colors.grey),
            child: child!);
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2900),
    ).then((value) {
      setState(() {
        endDate = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: startDatePicker,
              child: Text(
                'from : ${DateFormat("d-MMM-yyyy").format(startDate)}',
                style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: Colors.grey[900],
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: endDatePicker,
              child: Text(
                'to : ${DateFormat("d-MMM-yyyy").format(endDate)}',
                style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: Colors.grey[900],
                ),
              ),
            ),
          ),
        ],
      ),
      Expanded(
        child: PieChart(
          PieChartData(
            sections: widgetsPieChartSelectionData(widget.data, touchIndex),
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
          itemCount: widget.data.length,
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
                  widget.data[index],
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
                  widget.data[index].toString(),
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
