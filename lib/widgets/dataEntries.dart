import 'package:expense_tracker/pages/Data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataEntries {
  static DataRow dataEntries(
      String date, String category, String description, String amount) {
    return DataRow(cells: [
      DataCell(Text(date)),
      DataCell(Text(category)),
      DataCell(Text(description)),
      DataCell(Text(amount)),
      DataCell(PopupMenuButton<int>(
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
      ))
    ]);
  }
}
