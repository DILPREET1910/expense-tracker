import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

//date formatter import
import 'package:intl/intl.dart';

//import global variable
import 'package:expense_tracker/globalVariables.dart' as globals;

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  //Variables #start
  DateTime _datePicked = DateTime.now();
  String dropdownValue = 'mess';

  late TextEditingController date;
  late TextEditingController category;
  late TextEditingController amount;
  late TextEditingController description;

  @override
  void initState() {
    date = TextEditingController(
        text: DateFormat('dd-MMM-yyyy').format(DateTime.now()));
    category = TextEditingController(text: dropdownValue);
    amount = TextEditingController();
    description = TextEditingController();
    super.initState();
  }

  //Variables #end

  //Functions #start
  void _datePicker() {
    print(MediaQuery.of(context).size.width);
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100))
        .then((value) {
      setState(() {
        _datePicked = value!;
        globals.dateText = DateFormat('dd-MMM-yyyy').format(_datePicked);
        date = TextEditingController(text: globals.dateText);
      });
    });
  }

  //Functions #end
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //prevents overflow error when keyboard pops up in mobile devices
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //add data card #start
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.grey,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.grey[350],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //date and categories selectors #start
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //date selector #start
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                onPressed: _datePicker,
                                child: Text(
                                  globals.dateText,
                                  style: GoogleFonts.balooBhai2(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            //date selector #end
                            //categories dropdown #start
                            Expanded(
                              flex: 1,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  isExpanded: true,
                                  dropdownColor: Colors.grey[400],
                                  value: dropdownValue,
                                  focusColor: Colors.grey[350],
                                  icon: const Icon(
                                      Icons.arrow_drop_down_outlined),
                                  items: globals.list.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Center(
                                        child: Text(
                                          items,
                                          style: GoogleFonts.balooBhai2(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                      category = TextEditingController(
                                          text: dropdownValue);
                                    });
                                  },
                                ),
                              ),
                            ),
                            //categories dropdown #end
                          ],
                        ),
                      ),
                      //date and categories selectors #end
                      //amount input #start
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        height: 70,
                        width: _screenWidth / 1.5,
                        child: TextFormField(
                          controller: amount,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.grey[350]!, width: 0.01)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: Colors.grey[350]!)),
                              icon: const Icon(Icons.currency_rupee,
                                  color: Colors.black),
                              label: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  '*amount',
                                  style: GoogleFonts.balooBhai2(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                              ),
                              labelStyle: GoogleFonts.balooBhai2(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              )),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      //amount input #end
                      //description input #start
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        height: 70,
                        width: _screenWidth / 1.5,
                        child: TextFormField(
                          controller: description,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 5)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 5)),
                              icon: const Icon(Icons.description,
                                  color: Colors.black),
                              label: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  'description if any',
                                  style: GoogleFonts.balooBhai2(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                              ),
                              labelStyle: GoogleFonts.balooBhai2(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      //description input #end
                      //add button #start
                      TextButton(
                        onPressed: () {
                          setState(() {
                            print(category);
                            print('date = ${date.text}');
                            print('category = ${category.text}');
                            print('amount = ${amount.text}');
                            print('description = ${description.text}');
                          });
                        },
                        child: Container(
                          width: _screenWidth / 4.5,
                          decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              'add',
                              style: GoogleFonts.balooBhai2(
                                  color: Colors.white, fontSize: 20),
                            )),
                          ),
                        ),
                      ),
                      //add button #end
                    ],
                  ),
                ),
              ),
            ),
            //add data card #end
            //data entries list #start
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.grey[500],
                  child: Column(
                    children: [
                      Text('entry number 1'),
                      Text('entry number 2'),
                      Text('entry number 3'),
                    ],
                  ),
                ),
              ),
            ),
            //data entries list #end
          ],
        ),
      ),
    );
  }
}
