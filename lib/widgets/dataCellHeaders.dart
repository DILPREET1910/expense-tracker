import 'package:flutter/material.dart';

//google fonts imports
import 'package:google_fonts/google_fonts.dart';

class WidgetsDataCellHeader extends StatelessWidget {
  final double width;
  final String label;
  final bool? alignRight;

  const WidgetsDataCellHeader({
    super.key,
    required this.label,
    required this.width,
    this.alignRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignRight != null && alignRight! ? Alignment.centerRight : null,
      width: width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          label,
          overflow: TextOverflow.fade,
          maxLines: 1,
          style: GoogleFonts.ubuntu(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
