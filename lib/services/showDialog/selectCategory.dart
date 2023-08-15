import 'package:flutter/material.dart';

//lib imports
import 'package:expense_tracker/services/firebaseRealtimeDatabase.dart';
import 'package:expense_tracker/services/showDialog/addCategory.dart';

//spinkit imports
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

void selectCategory(BuildContext context, RealTimeDatabase realTimeDatabase) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.grey[400],
          content: SizedBox(
              //TODO: change select Category dialog ui here
              height: 200,
              width: 100,
              child: FutureBuilder(
                future: realTimeDatabase.getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    final categoryList = snapshot.data!.children.toList();
                    return ListView.builder(
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            categoryList[index].value.toString(),
                            style: GoogleFonts.ubuntu(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          trailing: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.edit),
                              SizedBox(width: 5),
                              Icon(Icons.delete)
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const SpinKitCircle(color: Colors.grey);
                  }
                },
              )),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  addCategory(context, realTimeDatabase);
                },
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 10),
                      Text("Add new category")
                    ]))
          ],
        );
      });
}
