import 'package:flutter/material.dart';

//lib imports
import 'package:expense_tracker/services/graph/colors.dart';

//google fonts imports
import 'package:google_fonts/google_fonts.dart';

//fl charts imports
import 'package:fl_chart/fl_chart.dart';

List<PieChartSectionData> widgetsPieChartSelectionData(
    List<List<dynamic>> nonZeroData, int touchIndex) {
  return List.generate(
      nonZeroData.length,
      (index) => PieChartSectionData(
          color: touchIndex == index ? pieColorsFocus[index] : pieColors[index],
          value: nonZeroData[index][1],
          title: nonZeroData[index][0].length <= 12
              ? nonZeroData[index][0]
              : "${nonZeroData[index][0].substring(0, 12)}...",
          titleStyle: touchIndex == index
              ? GoogleFonts.ubuntu(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  color: Colors.black)
              : GoogleFonts.ubuntu(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                  color: Colors.black54),
          radius: touchIndex == index ? 180 : 150));
}
