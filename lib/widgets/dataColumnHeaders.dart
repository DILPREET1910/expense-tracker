import 'package:flutter/material.dart';

//google fonts imports
import 'package:google_fonts/google_fonts.dart';

class WidgetsDataColumnHeader extends StatelessWidget {
  final String label;
  final bool? alignRight;

  const WidgetsDataColumnHeader(
      {super.key, required this.label, this.alignRight});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          alignRight != null && alignRight! ? Alignment.centerRight : null,
      child: Text(
        label,
        style: GoogleFonts.ubuntu(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            color: Colors.black),
      ),
    );
  }
}
