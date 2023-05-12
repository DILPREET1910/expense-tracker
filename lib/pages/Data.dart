import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//pub.dev plugins
import 'package:google_fonts/google_fonts.dart'; //google fonts
import 'package:intl/intl.dart'; //date formatter

//import lib/services
import 'package:expense_tracker/services/Data/data_model.dart';

//import lib/api
import 'package:expense_tracker/api/Google Sheets/user_sheet_api.dart';

//import lib files
import 'package:expense_tracker/globalVariables.dart' as globals;

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  //START: Variables
  DateTime _datePicked = DateTime.now();
  String dropdownValue = 'mess';

  //data entry variables
  late TextEditingController _date;
  late TextEditingController _category;
  late TextEditingController _amount;
  late TextEditingController _description;
  bool _validateAmount = false;

  //Initialise data entry variables
  @override
  void initState() {
    _date = TextEditingController(
        text: DateFormat('dd-MMM-yyyy').format(DateTime.now()));
    _category = TextEditingController(text: dropdownValue);
    _amount = TextEditingController();
    _description = TextEditingController();
    super.initState();
  }

  //Dispose data Entry variables
  @override
  void dispose() {
    _date.dispose();
    _category.dispose();
    _amount.dispose();
    _description.dispose();
    super.dispose();
  }

  //END: Variables

  //START: Functions
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
        _date = TextEditingController(text: globals.dateText);
      });
    });
  }

  //END: Functions

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
                                      _category = TextEditingController(
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
                          controller: _amount,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              errorText:
                                  _validateAmount ? '*required field' : null,
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
                          controller: _description,
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
                            _amount.text.isEmpty
                                ? _validateAmount = true
                                : _validateAmount = false;
                            // print(_category);
                            // print('date = ${_date.text}');
                            // print('category = ${_category.text}');
                            // print('amount = ${_amount.text}');
                            // print('description = ${_description.text}');
                            DataFields.dataEntry(_date.text, _category.text,
                                _amount.text, _description.text);
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
                  child: ListView.builder(
                    itemCount: UserSheetsApi.reversed?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(UserSheetsApi.reversed?[index].date +
                          " " +
                          UserSheetsApi.reversed?[index].category +
                          " " +
                          UserSheetsApi.reversed?[index].description +
                          " " +
                          UserSheetsApi.reversed?[index].amount);
                    },
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
