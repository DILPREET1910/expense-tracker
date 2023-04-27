import 'package:flutter/material.dart';

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
  String dropdownValue = 'item 1';

  //Variables #end

  //Functions #start
  void _datePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100))
        .then((value) {
      setState(() {
        _datePicked = value!;
        globals.dateText = DateFormat('dd-MMM-yyyy').format(_datePicked);
      });
    });
  }

  //Functions #end
  @override
  Widget build(BuildContext context) {
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
                    children: [
                      //date and categories selectors #start
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //date selector #start
                            TextButton(
                              onPressed: _datePicker,
                              child: Text(globals.dateText),
                            ),
                            //date selector #end
                            //categories dropdown #start
                            DropdownButton(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                              items: globals.list.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newvalue) {
                                setState(() {
                                  dropdownValue = newvalue!;
                                });
                              },
                            ),
                            //categories dropdown #end
                          ],
                        ),
                      ),
                      //date and categories selectors #end
                      //amount input #start
                      TextFormField(),
                      //amount input #end
                      //description input #start
                      TextFormField(),
                      //description input #end
                      //add button #start
                      TextButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text('add'),
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
