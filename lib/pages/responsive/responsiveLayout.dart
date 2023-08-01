import 'package:flutter/material.dart';

//lib imports
import 'package:expense_tracker/pages/responsive/mobile.dart';
import 'package:expense_tracker/pages/responsive/tablet.dart';
import 'package:expense_tracker/pages/responsive/desktop.dart';

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 750) {
        return const Mobile();
      } else if (constraints.maxWidth < 1100) {
        return const Tablet();
      } else {
        return const Desktop();
      }
    });
  }
}
