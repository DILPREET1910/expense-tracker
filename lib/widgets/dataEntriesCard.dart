import 'package:flutter/material.dart';

// services imports
import 'package:expense_tracker/services/firebaseRealtimeDatabase.dart';

// widgets imports
import 'package:expense_tracker/widgets/editEntries.dart';
import 'package:expense_tracker/widgets/dataColumnHeaders.dart';
import 'package:expense_tracker/widgets/dataCellHeaders.dart';

// firebase imports
import 'package:firebase_database/firebase_database.dart';

// spin kit imports
import 'package:flutter_spinkit/flutter_spinkit.dart';

// intl imports
import 'package:intl/intl.dart';

class WidgetsDataEntriesCard extends StatefulWidget {
  const WidgetsDataEntriesCard({super.key});

  @override
  State<WidgetsDataEntriesCard> createState() => _WidgetsDataEntriesCardState();
}

class _WidgetsDataEntriesCardState extends State<WidgetsDataEntriesCard> {
  // edit data entries
  void showEdit(BuildContext context, DataSnapshot snapshot) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.grey[400],
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 2.7,
            child: WidgetsEditDataEntry(
                setParentState: (value) {
                  setState(() {});
                },
                snapshot: snapshot),
          ),
        );
      },
    );
  }

  RealTimeDatabase realTimeDatabase = RealTimeDatabase();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey[900]!,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      shadowColor: Colors.black,
      color: Colors.grey,
      child: FutureBuilder(
        future: realTimeDatabase.getDataEntries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dataRowMinHeight: 30,
                    dataRowMaxHeight: 30,
                    border: TableBorder.all(
                      width: 2,
                      color: Colors.grey[900]!,
                    ),
                    headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey[700]!),
                    horizontalMargin: 10,
                    columnSpacing: 10,
                    columns: const [
                      DataColumn(label: WidgetsDataColumnHeader(label: 'date')),
                      DataColumn(label: WidgetsDataColumnHeader(label: 'category')),
                      DataColumn(label: WidgetsDataColumnHeader(label: 'description')),
                      DataColumn(label: WidgetsDataColumnHeader(label: 'amount')),
                    ],
                    rows: snapshot.data!.children
                        .map(
                          (data) => DataRow(
                            onLongPress: () {
                              showEdit(context, data);
                            },
                            cells: [
                              // DateFormat("d-MMM-yyyy").format(_dateTime),
                              DataCell(
                                WidgetsDataCellHeader(
                                  label: DateFormat("d-MMM-yyyy").format(
                                    DateTime.parse(
                                      data.child('date').value.toString(),
                                    ),
                                  ),
                                  width: 99,
                                ),
                              ),
                              DataCell(
                                WidgetsDataCellHeader(
                                  label: data.child('category').value.toString(),
                                  width: 100,
                                ),
                              ),
                              DataCell(
                                WidgetsDataCellHeader(
                                  label: data.child('description').value.toString(),
                                  width: 200,
                                ),
                              ),
                              DataCell(
                                WidgetsDataCellHeader(
                                  label: data.child('amount').value.toString(),
                                  width: 50,
                                  alignRight: true,
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList()
                        .reversed
                        .toList(),
                  ),
                ),
              ),
            );
          } else {
            return SpinKitCircle(color: Colors.grey[900]);
          }
        },
      ),
    );
  }
}
