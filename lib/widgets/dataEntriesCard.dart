import 'package:flutter/material.dart';

class WidgetsDataEntriesCard extends StatefulWidget {
  const WidgetsDataEntriesCard({super.key});

  @override
  State<WidgetsDataEntriesCard> createState() => _WidgetsDataEntriesCardState();
}

class _WidgetsDataEntriesCardState extends State<WidgetsDataEntriesCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey[900]!,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(15)),
      elevation: 50,
      shadowColor: Colors.black,
      color: Colors.grey,
      child: Column(
        children: [
          Text("this is the data entires card"),
        ],
      ),
    );
  }
}
