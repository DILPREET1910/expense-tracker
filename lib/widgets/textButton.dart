import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetsTextButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;

  const WidgetsTextButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 7, 0,
          MediaQuery.of(context).size.width / 7, 0),
      height: 65,
      decoration: BoxDecoration(
          color: Colors.grey[900], borderRadius: BorderRadius.circular(40)),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.balooBhai2(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
