import 'package:flutter/material.dart';

//google fonts imports
import 'package:google_fonts/google_fonts.dart';

class WidgetsDataCellHeader extends StatelessWidget {
  final String label;

  const WidgetsDataCellHeader({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.ubuntu(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
      ),
    );
  }
}
