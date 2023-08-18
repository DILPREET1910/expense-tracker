import 'package:expense_tracker/services/firebaseRealtimeDatabase.dart';
import 'package:expense_tracker/widgets/dataColumnHeaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:expense_tracker/widgets/dataCellHeaders.dart';
import 'package:intl/intl.dart';

class WidgetsDataEntriesCard extends StatefulWidget {
  const WidgetsDataEntriesCard({super.key});

  @override
  State<WidgetsDataEntriesCard> createState() => _WidgetsDataEntriesCardState();
}

class _WidgetsDataEntriesCardState extends State<WidgetsDataEntriesCard> {
  RealTimeDatabase realTimeDatabase = RealTimeDatabase();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey[900]!,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      shadowColor: Colors.black,
      color: Colors.grey,
      child: FutureBuilder(
        future: realTimeDatabase.getDataEntries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: WidgetsDataColumnHeader(label: 'date')),
                  DataColumn(label: WidgetsDataColumnHeader(label: 'category')),
                  DataColumn(
                      label: WidgetsDataColumnHeader(label: 'description')),
                  DataColumn(label: WidgetsDataColumnHeader(label: 'amount')),
                ],
                rows: snapshot.data!.children
                    .map((data) => DataRow(cells: [
                          // DateFormat("d-MMM-yyyy").format(_dateTime),
                          DataCell(WidgetsDataCellHeader(
                              label: DateFormat("d-MMM-yyyy").format(
                                  DateTime.parse(
                                      data.child('date').value.toString())))),
                          DataCell(WidgetsDataCellHeader(
                              label: data.child('category').value.toString())),
                          DataCell(WidgetsDataCellHeader(
                              label:
                                  data.child('description').value.toString())),
                          DataCell(WidgetsDataCellHeader(
                              label: data.child('amount').value.toString())),
                        ]))
                    .toList(),
              ),
            );
          } else {
            return const SpinKitCircle(color: Colors.grey);
          }
        },
      ),
    );
  }
}
