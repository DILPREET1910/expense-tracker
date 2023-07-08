import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  ResponsiveLayout(
      {required this.mobile, required this.tablet, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 750) {
        return mobile;
      } else if (constraints.maxWidth < 1100) {
        return tablet;
      } else {
        return desktop;
      }
    });
  }
}
