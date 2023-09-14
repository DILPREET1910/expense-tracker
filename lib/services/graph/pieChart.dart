import 'dart:collection';
import 'package:expense_tracker/widgets/dataCellHeaders.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//lib imports
import 'package:expense_tracker/services/graph/colors.dart';
import 'package:expense_tracker/services/graph/pieChartSectionData.dart';
import 'package:expense_tracker/widgets/dataColumnHeaders.dart';

//google fonts imports
import 'package:google_fonts/google_fonts.dart';

//fl charts imports
import 'package:fl_chart/fl_chart.dart';

class WidgetsPieChart extends StatefulWidget {
  final List<String> categoriesList;
  final List<List<dynamic>> dataEntriesList;

  const WidgetsPieChart(
      {super.key, required this.categoriesList, required this.dataEntriesList});

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
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 100),
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
      firstDate: startDate,
      lastDate: DateTime(DateTime.now().year + 100),
    ).then((value) {
      setState(() {
        endDate = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // sorted data hash map
    Map<String, double> sortedData = HashMap();

    widget.categoriesList.forEach((category) {
      sortedData.putIfAbsent(category, () => 0.0);
    });

    widget.dataEntriesList.forEach((element) {
      /*
      0 index - Date Time in string
      1 index - amount
      2 index - description
      3 index - category
      */
      // FIXME : web error due to DateTIme.parse(element[0])
      DateTime currentDate = DateTime.parse(element[0]);
      if ((currentDate.isAfter(startDate) ||
              currentDate.isAtSameMomentAs(startDate)) &&
          (currentDate.isBefore(endDate) ||
              currentDate.isAtSameMomentAs(endDate))) {
        int integer = int.parse(element[1]);
        sortedData.update(element[3], (value) => value + integer);
      }
    });

    List<List<dynamic>> nonZeroData = [];
    double total = 0.0;
    //get total amount
    sortedData.forEach((key, value) {
      total += value;
    });
    //set nonZeroData
    sortedData.forEach((key, value) {
      if (value != 0.0) nonZeroData.add([key, value, (value / total) * 100]);
    });

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
            sections: widgetsPieChartSelectionData(nonZeroData, touchIndex),
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
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey[900]!,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          shadowColor: Colors.black,
          color: Colors.grey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                border: TableBorder.all(width: 2, color: Colors.grey[900]!),
                horizontalMargin: 10,
                columnSpacing: 10,
                columns: const [
                  DataColumn(label: WidgetsDataColumnHeader(label: 'Category')),
                  DataColumn(label: WidgetsDataColumnHeader(label: 'Amount')),
                  DataColumn(
                      label: WidgetsDataColumnHeader(label: 'Percentage')),
                ],
                rows: nonZeroData
                    .map(
                      (element) => DataRow(
                        cells: [
                          DataCell(
                            WidgetsDataCellHeader(
                              label: element[0],
                              width: 120,
                            ),
                          ),
                          DataCell(
                            WidgetsDataCellHeader(
                              label: element[1].toString(),
                              width: 100,
                              alignRight: true,
                            ),
                          ),
                          DataCell(
                            WidgetsDataCellHeader(
                              label: "${element[2].toStringAsFixed(2)}%",
                              width: 100,
                              alignRight: true,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        // child: ListView.builder(
        //   itemCount: nonZeroData.length,
        //   itemBuilder: (context, index) {
        //     return Listener(
        //       onPointerDown: (value) {
        //         setState(() {
        //           touchIndex = index;
        //         });
        //       },
        //       onPointerUp: (value) {
        //         setState(() {
        //           touchIndex = -1;
        //         });
        //       },
        //       child: ListTile(
        //         leading: touchIndex == index
        //             ? Icon(Icons.square_rounded, color: pieColorsFocus[index])
        //             : Icon(Icons.circle, color: pieColors[index]),
        //         title: Text(
        //           nonZeroData[index][0],
        //           style: touchIndex == index
        //               ? GoogleFonts.ubuntu(
        //                   fontSize: 25,
        //                   fontWeight: FontWeight.w600,
        //                   letterSpacing: 2,
        //                   color: Colors.black)
        //               : GoogleFonts.ubuntu(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w500,
        //                   letterSpacing: 1,
        //                   color: Colors.black54),
        //         ),
        //         trailing: Text(
        //           nonZeroData[index][1].toString(),
        //           style: touchIndex == index
        //               ? GoogleFonts.ubuntu(
        //                   fontSize: 25,
        //                   fontWeight: FontWeight.w600,
        //                   letterSpacing: 2,
        //                   color: Colors.black)
        //               : GoogleFonts.ubuntu(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w500,
        //                   letterSpacing: 1,
        //                   color: Colors.black54),
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ),
    ]);
  }
}
