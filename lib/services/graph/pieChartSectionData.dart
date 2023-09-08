import 'package:flutter/material.dart';

//lib imports
import 'package:expense_tracker/services/graph/colors.dart';

//google fonts imports
import 'package:google_fonts/google_fonts.dart';

//fl charts imports
import 'package:fl_chart/fl_chart.dart';

List<PieChartSectionData> widgetsPieChartSelectionData(
    Map<String, double> data, int touchIndex) {
  List<PieChartSectionData> sections;
  List<String> categories = [];
  List<double> values = [];
  data.forEach((key, value) {
    categories.add(key);
    values.add(value);
  });
  return List.generate(
      data.length,
      (index) => PieChartSectionData(
          color: touchIndex == index ? pieColorsFocus[index] : pieColors[index],
          value: values[index],
          title: categories[index],
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
