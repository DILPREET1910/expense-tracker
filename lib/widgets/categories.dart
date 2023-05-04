import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      color: Colors.blueGrey[100],
      elevation: 5,
      shadowColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //icon #start
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.money,
                size: 30,
                color: Colors.black,
              ),
            ),
            //icon #end
            //category name #start
            Text(
              widget.name,
              style: GoogleFonts.balooBhai2(
                fontSize: 20,
                letterSpacing: 5,
              ),
            ),
            //category name #end
            //amount + pop up menu #start
            Row(
              children: [
                //category amount #start
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(widget.amount),
                ),
                //category amount #end
                //pop up menu button #start
                PopupMenuButton<int>(
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
                )
                //pop up menu button #end
              ],
            )
            //amount + pop up menu #start
          ],
        ),
      ),
    );
  }
}
