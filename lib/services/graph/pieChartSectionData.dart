import 'package:expense_tracker/services/graph/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<PieChartSectionData> widgetsPieChartSelectionData(
    List<List<dynamic>> data, int touchIndex) {
  return List.generate(
      data.length,
      (index) => PieChartSectionData(
          color: touchIndex == index ? pieColorsFocus[index] : pieColors[index],
          value: data[index][0],
          title: data[index][1],
          titleStyle: touchIndex == index
              ? GoogleFonts.ubuntu(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  color: Colors.black)
              : GoogleFonts.ubuntu(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: Colors.black54),
          radius: touchIndex == index ? 180 : 150));
}
