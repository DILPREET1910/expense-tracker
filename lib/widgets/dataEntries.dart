import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataEntries extends StatefulWidget {
  String date;
  String category;
  String description;
  String amount;

  DataEntries(
      {super.key,
      required this.date,
      required this.category,
      required this.description,
      required this.amount});

  @override
  State<DataEntries> createState() => _DataEntriesState();
}

class _DataEntriesState extends State<DataEntries> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //START: Date
            Text(
              widget.date,
              style: GoogleFonts.balooBhai2(
                fontSize: 20,
                letterSpacing: 5,
              ),
            ),
            //END: Date
            //START: Categories
            Text(
              widget.category,
              style: GoogleFonts.balooBhai2(
                fontSize: 20,
                letterSpacing: 5,
              ),
            ),
            //END: Categories
            //START: Description
            Text(
              widget.description,
              style: GoogleFonts.balooBhai2(
                fontSize: 20,
                letterSpacing: 0,
              ),
            ),
            //END: Description
            //START: Amount
            Text(
              widget.amount,
              style: GoogleFonts.balooBhai2(
                fontSize: 20,
                letterSpacing: 4,
              ),
            ),
            //END: Amount
            //START: pop up menu
            PopupMenuButton<int>(
              itemBuilder: (context) => [
                //pop up menu 1st item
                const PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.edit),
                      ),
                      Text('Edit'),
                    ],
                  ),
                ),
                //pop up menu 2nd item
                const PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.delete),
                      ),
                      Text('Delete'),
                    ],
                  ),
                )
              ],
            )
            //END: pop up menu
          ],
        ),
      ),
    );
  }
}
