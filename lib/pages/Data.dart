import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      //date and categories #start
                      Row(),
                      //date and categories #end
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
