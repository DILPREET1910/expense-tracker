import 'package:flutter/material.dart';

//google fonts imports
import 'package:google_fonts/google_fonts.dart';

class WidgetsTextButton1 extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const WidgetsTextButton1(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        label,
        style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.w500, color: Colors.white, letterSpacing: 2),
      ),
    );
  }
}
