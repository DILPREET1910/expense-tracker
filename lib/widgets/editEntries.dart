import 'package:flutter/material.dart';

// services imports
import 'package:expense_tracker/services/firebaseRealtimeDatabase.dart';
import 'package:expense_tracker/services/showDialog/addCategory.dart';

// widget imports
import 'package:expense_tracker/widgets/textFormField.dart';

// firebase imports
import 'package:firebase_database/firebase_database.dart';

// google fonts imports
import 'package:google_fonts/google_fonts.dart';

// spin kit imports
import 'package:flutter_spinkit/flutter_spinkit.dart';

// intl imports
import 'package:intl/intl.dart';

class WidgetsEditDataEntry extends StatefulWidget {
  Function(bool value) setParentState;
  final DataSnapshot snapshot;

  WidgetsEditDataEntry({super.key, required this.setParentState, required this.snapshot});

  @override
  State<WidgetsEditDataEntry> createState() => _WidgetsEditDataEntryState();
}

class _WidgetsEditDataEntryState extends State<WidgetsEditDataEntry> {
  // DateTime Variable
  DateTime dateTime = DateTime.now();

  // Category variable
  String category = '';

  //TextField controllers
  final TextEditingController amountTextController = TextEditingController();
  final TextEditingController descriptionTextController = TextEditingController();

  @override
  void initState() {
    //set DateTime variable
    dateTime = DateTime.parse(widget.snapshot.child('date').value.toString());

    // set category variable
    category = widget.snapshot.child('category').value.toString();

    // set text editing controller
    amountTextController.text = widget.snapshot.child('amount').value.toString();
    descriptionTextController.text = widget.snapshot.child('description').value.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //real time database instance
    RealTimeDatabase realTimeDatabase = RealTimeDatabase();

    //datePicker functions
    void functionShowDatePicker() {
      showDatePicker(
        builder: (context, child) {
          return Theme(
              data: ThemeData().copyWith(
                  colorScheme: ColorScheme.light(primary: Colors.grey[900]!),
                  dialogBackgroundColor: Colors.grey),
              child: child!);
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 100),
      ).then((value) {
        setState(() {
          dateTime = value!;
        });
      });
    }

    //category picker
    void selectCategory() {
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.grey[400],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
          ),
          builder: (context) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return StatefulBuilder(
                  builder: (context, StateSetter secondSetState) {
                    return FutureBuilder(
                      future: realTimeDatabase.getCategories(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                          final categoryList = snapshot.data!.children.toList();
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                height: constraints.maxHeight - 66,
                                child: ListView.builder(
                                  itemCount: categoryList.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            category = categoryList[index].value.toString();
                                          });
                                        },
                                        child: Text(
                                          categoryList[index].value.toString(),
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 23,
                                            letterSpacing: 1,
                                            wordSpacing: 2,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.edit),
                                          const SizedBox(width: 5),
                                          GestureDetector(
                                              onTap: () async {
                                                await realTimeDatabase.removeCategory(
                                                    categoryList[index].key.toString(),
                                                    secondSetState);
                                              },
                                              child: const Icon(Icons.delete))
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  addCategory(context, realTimeDatabase, secondSetState);
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  // padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add, size: 25, color: Colors.grey[400]),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Add new category",
                                        style: GoogleFonts.ubuntu(
                                          color: Colors.grey[400],
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return SpinKitCircle(color: Colors.grey[900]);
                        }
                      },
                    );
                  },
                );
              },
            );
          });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //START: Date and Catergory picker
        Row(
          children: [
            //START: Date Picker
            Expanded(
              flex: 1,
              child: TextButton(
                  onPressed: functionShowDatePicker,
                  child: Text(
                    DateFormat("d-MMM-yyyy").format(dateTime),
                    style: GoogleFonts.ubuntu(
                        fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
                  )),
            ),
            //END: Date Picker
            //START: Category Picker
            Expanded(
              flex: 1,
              child: TextButton(
                  onPressed: selectCategory,
                  child: Text(
                    category,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 1,
                    style: GoogleFonts.ubuntu(
                        fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
                  )),
            ),
            //END: Category Picker
            const SizedBox(width: 18)
          ],
        ),
        //END: Date and Category picker
        //START: Amount text input
        WidgetsTextFormFields(
            label: "*amount",
            isInteger: true,
            lessMargin: true,
            icon: const Icon(
              Icons.currency_rupee,
              color: Colors.black,
            ),
            controller: amountTextController),
        //END: Amount text input
        //START: Description text input
        WidgetsTextFormFields(
            label: "description if any",
            lessMargin: true,
            icon: const Icon(
              Icons.description_outlined,
              color: Colors.black,
            ),
            controller: descriptionTextController),
        //END: Description text input
        //START: cancel save button
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'cancel',
                  style: GoogleFonts.ubuntu(
                    fontSize: MediaQuery.of(context).size.width / 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'save',
                  style: GoogleFonts.ubuntu(
                    fontSize: MediaQuery.of(context).size.width / 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        //END: cancel save button
      ],
    );
  }
}
