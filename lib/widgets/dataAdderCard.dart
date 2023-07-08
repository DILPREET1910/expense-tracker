import 'package:expense_tracker/widgets/textButton.dart';
import 'package:expense_tracker/widgets/textFormField.dart';
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
          WidgetsTextFormFields(
              label: "*amount",
              icon: const Icon(
                Icons.currency_rupee,
                color: Colors.black,
              ),
              controller: _amountTextController),
          //END: Amount text input
          //START: Description text input
          WidgetsTextFormFields(
              label: "description if any",
              icon: const Icon(
                Icons.description_outlined,
                color: Colors.black,
              ),
              controller: _descriptionTextController),
          //END: Description text input
          //START: Add button
          WidgetsTextButton(onPressed: () {}, label: "add")
          //END: Add button
        ],
      ),
    );
  }
}
