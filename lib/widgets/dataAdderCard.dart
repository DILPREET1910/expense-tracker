import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetsDataAdderCard extends StatefulWidget {
  const WidgetsDataAdderCard({super.key});

  @override
  State<WidgetsDataAdderCard> createState() => _WidgetsDataAdderCardState();
}

class _WidgetsDataAdderCardState extends State<WidgetsDataAdderCard> {
  //TextField controllers
  final TextEditingController _amountTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //START: Date and Catergory picker
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //START: Date Picker
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "date picker",
                    style: GoogleFonts.balooBhai2(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  )),
              //END: Date Picker
              //START: Category Picker
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "category picker",
                    style: GoogleFonts.balooBhai2(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ))
              //END: Category Picker
            ],
          ),
          //END: Date and Category picker
          //START: Amount text input
          Container(
            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 7,
                0, MediaQuery.of(context).size.width / 7, 0),
            height: 65,
            decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(width: 3, color: Colors.grey[900]!),
                borderRadius: BorderRadius.circular(40)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 2),
              child: TextFormField(
                controller: _amountTextController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: const Icon(
                    Icons.currency_rupee,
                    color: Colors.black,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "*amount",
                      style: GoogleFonts.balooBhai2(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //END: Amount text input
          //START: Description text input
          Container(
            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 7,
                0, MediaQuery.of(context).size.width / 7, 0),
            height: 65,
            decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(width: 3, color: Colors.grey[900]!),
                borderRadius: BorderRadius.circular(40)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 2),
              child: TextFormField(
                controller: _descriptionTextController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: const Icon(
                    Icons.description_outlined,
                    color: Colors.black,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "description if any",
                      style: GoogleFonts.balooBhai2(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //END: Description text input
          //START: Add button
          Container(
            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 5,
                0, MediaQuery.of(context).size.width / 5, 0),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  "add",
                  style: GoogleFonts.balooBhai2(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
              ),
            ),
          )
          //END: Add button
        ],
      ),
    );
  }
}
