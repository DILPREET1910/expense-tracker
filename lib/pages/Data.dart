import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//pub.dev plugins
import 'package:google_fonts/google_fonts.dart'; //google fonts
import 'package:intl/intl.dart'; //date formatter

//import lib/api
import 'package:expense_tracker/api/Google Sheets/user_sheet_api.dart';

//import lib/services
import 'package:expense_tracker/services/Data/data_model.dart';

//import lib/widgets
import 'package:expense_tracker/widgets/dataEntries.dart';

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
    List<DataRow> rows = [];
    for (int i = 0; i < UserSheetsApi.reversed!.length; i++) {
      rows.add(DataEntries.dataEntries(
          UserSheetsApi.reversed?[i].date,
          UserSheetsApi.reversed?[i].category,
          UserSheetsApi.reversed?[i].description,
          UserSheetsApi.reversed?[i].amount));
    }

    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //prevents overflow error when keyboard pops up in mobile devices
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //START: Add data card
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
                      //START: Date and Categories slectors
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //START: Date selector
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
                            //END: Date selector
                            //START: Categories dropdown
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
                            //END: Categories dropdown
                          ],
                        ),
                      ),
                      //END: Date and Categories selectors
                      //START: Amount input
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
                      //END: Amount input
                      //START: Description input
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
                      //END: Description input
                      //START: Add button
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
                      //END: Add button
                    ],
                  ),
                ),
              ),
            ),
            //END: Add data card
            //START: Data entries card
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.grey[500],
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19)),
                    color: Colors.blueGrey[100],
                    elevation: 5,
                    shadowColor: Colors.black12,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('Date')),
                            DataColumn(label: Text('Category')),
                            DataColumn(label: Text('Description')),
                            DataColumn(label: Text('Amount')),
                            DataColumn(label: Text(''))
                          ],
                          rows: rows,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //END: Data entries card
          ],
        ),
      ),
    );
  }
}
