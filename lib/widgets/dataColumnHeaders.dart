import 'package:flutter/material.dart';

//google fonts imports
import 'package:google_fonts/google_fonts.dart';

class WidgetsDataColumnHeader extends StatelessWidget {
  final String label;

  const WidgetsDataColumnHeader({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.ubuntu(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
      ),
    );
  }
}
