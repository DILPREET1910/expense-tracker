import 'package:expense_tracker/widgets/dataAdderCard.dart';
import 'package:expense_tracker/widgets/dataEntriesCard.dart';
import 'package:flutter/material.dart';

class WidgetsDataEntry extends StatefulWidget {
  const WidgetsDataEntry({super.key});

  @override
  State<WidgetsDataEntry> createState() => _WidgetsDataEntryState();
}

class _WidgetsDataEntryState extends State<WidgetsDataEntry> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 7.5),
          child: WidgetsDataAdderCard(),
        )),
        Expanded(child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 7.5),
          child: WidgetsDataEntriesCard(),
        ))
      ],
    );
  }
}
