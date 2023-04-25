import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatefulWidget {
  String name;
  String amount;
  String icon;

  Categories(
      {super.key,
      required this.name,
      required this.amount,
      required this.icon});

  @override
  State<Categories> createState() => CategoriesCard();
}

class CategoriesCard extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      color: Colors.blueGrey[100],
      elevation: 5,
      shadowColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //icon #start
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.money,
                size: 30,
                color: Colors.black,
              ),
            ),
            //icon #end
            Text(
              widget.name,
              style: GoogleFonts.balooBhai2(
                fontSize: 20,
                letterSpacing: 5,
              ),
            ),
            Text(widget.amount),
          ],
        ),
      ),
    );
  }
}
