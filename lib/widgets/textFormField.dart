import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetsTextFormFields extends StatelessWidget {
  final String label;
  final Icon icon;
  final TextEditingController controller;
  final bool? obscure;
  final bool? isInteger;
  final bool? lessMargin;

  const WidgetsTextFormFields({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.obscure,
    this.isInteger,
    this.lessMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: lessMargin != null
          ? EdgeInsets.symmetric(vertical: 0, horizontal: MediaQuery.of(context).size.width / 19)
          : EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width / 7, 0, MediaQuery.of(context).size.width / 7, 0),
      height: 65,
      decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(width: 3, color: Colors.grey[900]!),
          borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 2),
        child: TextFormField(
          keyboardType: (isInteger == true) ? const TextInputType.numberWithOptions() : null,
          obscureText: (obscure == null) ? false : obscure!,
          controller: controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: icon,
            label: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                label,
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w400, color: Colors.black, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
