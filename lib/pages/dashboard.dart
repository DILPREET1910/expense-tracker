import 'package:flutter/material.dart';

//lib imports
import 'package:expense_tracker/widgets/appBar.dart';
import 'package:expense_tracker/services/firebaseRealtimeDatabase.dart';
import 'package:expense_tracker/services/graph/pieChart.dart';

//spinkit imports
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WidgetsDashBoard extends StatefulWidget {
  final bool appBar;

  const WidgetsDashBoard({super.key, required this.appBar});

  @override
  State<WidgetsDashBoard> createState() => _WidgetsDashBoardState();
}

class _WidgetsDashBoardState extends State<WidgetsDashBoard> {
  RealTimeDatabase realTimeDatabase = RealTimeDatabase();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: widget.appBar
            ? WidgetsAppBar(height: 50)
            : WidgetsAppBar(height: 0),
        backgroundColor: Colors.grey[400],
        //future builder for list of categories
        body: FutureBuilder(
            future: realTimeDatabase.getCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SpinKitCircle(color: Colors.grey[900]);
              } else {
                //future builder for list of data entries
                return FutureBuilder(
                    future: realTimeDatabase.getDataEntries(),
                    builder: (context, snapshot1) {
                      if (snapshot1.connectionState ==
                          ConnectionState.waiting) {
                        return SpinKitCircle(color: Colors.grey[900]);
                      } else {
                        return WidgetsPieChart(
                          categoriesList: snapshot.data!.children
                              .map((e) => e.value.toString())
                              .toList(),
                          dataEntriesList: snapshot1.data!.children
                              .map((data) => data.children
                                  .map((entries) => entries.value.toString())
                                  .toList())
                              .toList(),
                        );
                      }
                    });
              }
            }),
      ),
    );
  }
}
