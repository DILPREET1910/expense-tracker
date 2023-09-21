import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//lib imports
import 'package:expense_tracker/services/firebaseRealtimeDatabase.dart';
import 'package:expense_tracker/services/showDialog/addCategory.dart';
import 'package:expense_tracker/widgets/textButton.dart';
import 'package:expense_tracker/widgets/textFormField.dart';

//google fonts imports
import 'package:google_fonts/google_fonts.dart';

//spinkit imports
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WidgetsDataAdderCard extends StatefulWidget {
  Function(bool value) setParentState;

  WidgetsDataAdderCard({super.key, required this.setParentState});

  @override
  State<WidgetsDataAdderCard> createState() => _WidgetsDataAdderCardState();
}

class _WidgetsDataAdderCardState extends State<WidgetsDataAdderCard> {
  //real time database instance
  RealTimeDatabase realTimeDatabase = RealTimeDatabase();

  //TextField controllers
  final TextEditingController _amountTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();

  //datePicker functions
  void _showDatePicker() {
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
        _dateTime = value!;
      });
    });
  }

  //category picker
  void _selectCategory() {
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
          return StatefulBuilder(
            builder: (context, StateSetter secondSetState) {
              return FutureBuilder(
                future: realTimeDatabase.getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    final categoryList = snapshot.data!.children.toList();
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          height: MediaQuery.sizeOf(context).height / 2,
                          child: ListView.builder(
                            itemCount: categoryList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      category =
                                          categoryList[index].value.toString();
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
                                              categoryList[index]
                                                  .key
                                                  .toString(),
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
                            addCategory(
                                context, realTimeDatabase, secondSetState);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add,
                                  size: 25, color: Colors.grey[900]),
                              const SizedBox(width: 10),
                              Text(
                                "Add new category",
                                style: GoogleFonts.ubuntu(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
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
        });
  }

  //DateTime variable
  DateTime _dateTime = DateTime.now();

  //Category variable
  String? category;

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
            children: [
              //START: Date Picker
              Expanded(
                flex: 1,
                child: TextButton(
                    onPressed: _showDatePicker,
                    child: Text(
                      DateFormat("d-MMM-yyyy").format(_dateTime),
                      style: GoogleFonts.ubuntu(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    )),
              ),
              //END: Date Picker
              //START: Category Picker
              Expanded(
                flex: 1,
                child: TextButton(
                    onPressed: _selectCategory,
                    child: Text(
                      category ?? 'select category',
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 1,
                      style: GoogleFonts.ubuntu(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
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
          WidgetsTextButton(
              onPressed: () {
                realTimeDatabase
                    .addDataEntry(
                        DateTime(_dateTime.year, _dateTime.month, _dateTime.day)
                            .toString(),
                        category!,
                        double.parse(_amountTextController.text.trim()),
                        _descriptionTextController.text.trim())
                    .then((value) => widget.setParentState(true));
                _amountTextController.clear();
                _descriptionTextController.clear();
              },
              label: "add")
          //END: Add button
        ],
      ),
    );
  }
}
