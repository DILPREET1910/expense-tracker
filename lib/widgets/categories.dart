import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  String name;
  String amount;
  String icon;

  Categories(
      {super.key,
      required this.name,
      required this.amount,
      required this.icon});

  @override
  State<Categories> createState() => CategoriesCard();
}

class CategoriesCard extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,

      child: Row(
        children: [
          Text(widget.name),
          Text(widget.amount),
          Text(widget.icon),
        ],
      ),
    );
  }
}
