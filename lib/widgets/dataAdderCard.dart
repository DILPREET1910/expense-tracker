import 'package:flutter/material.dart';

class WidgetsDataAdderCard extends StatefulWidget {
  const WidgetsDataAdderCard({super.key});

  @override
  State<WidgetsDataAdderCard> createState() => _WidgetsDataAdderCardState();
}

class _WidgetsDataAdderCardState extends State<WidgetsDataAdderCard> {
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
      child: Column(
        children: [
          Text("this is the adder card"),
        ],
      ),
    );
  }
}
