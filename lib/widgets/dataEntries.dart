import 'package:flutter/material.dart';

//importing date formatter
import 'package:intl/intl.dart';

class DataEntries {
  //epoch to normal date converter function
  static var epoch = DateTime(1899, 12, 30);

  static String noEpoch(String date) {
    var currentDate = epoch.add(Duration(days: int.parse(date)));
    var returnThis = DateFormat('dd-MMM-yyyy').format(currentDate);
    return returnThis;
  }

  static DataRow dataEntries(
      String date, String category, String description, String amount) {
    return DataRow(cells: [
      DataCell(Text(noEpoch(date))),
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
