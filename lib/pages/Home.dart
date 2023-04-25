import 'package:flutter/material.dart';

//google fonts package
import 'package:google_fonts/google_fonts.dart';

// custom lib/widgets
import 'package:expense_tracker/widgets/categories.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //card view start #start
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.grey[350],
                  //contents inside card view #start
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        //Balance text #start
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              'Balance',
                              style: GoogleFonts.baloo2(
                                fontSize: 30,
                                color: Colors.black54,
                                letterSpacing: 10,
                              ),
                            ),
                          ),
                        ),
                        //Balance text #end
                        //Balance amount #start
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Text(
                              '9,99,999₹',
                              style: GoogleFonts.baloo2(
                                fontSize: 50,
                                color: Colors.black,
                                letterSpacing: 5,
                              ),
                            ),
                          ),
                        ),
                        //Balance amount #end
                        //Target-Expense section row #start
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //Target section #start
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.crisis_alert,
                                        color: Colors.black54,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Target',
                                    style: GoogleFonts.baloo2(
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                              //Target section #end
                              //Expense section #start
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.arrow_downward,
                                        color: Colors.black54,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Target',
                                        style: GoogleFonts.baloo2(
                                          color: Colors.black54,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        '5,000₹',
                                        style: GoogleFonts.balooBhai2(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              //Expense section #end
                            ],
                          ),
                        ),
                        //Target-Expense section row #end
                      ],
                    ),
                  ),
                  //contents inside card view #end
                ),
              ),
            ),
            //card view start #end
            //categories section #start
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return Categories(
                        name: 'name', amount: '100', icon: 'icon');
                  },
                ),
              ),
            )
            //categories section #end
          ],
        ),
      ),
    );
  }
}
