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
        body: FutureBuilder(
            future: realTimeDatabase.getCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SpinKitCircle(color: Colors.grey);
              } else {
                return WidgetsPieChart(
                    data: snapshot.data!.children
                        .map((e) => e.value.toString())
                        .toList());
              }
            }),
      ),
    );
  }
}
