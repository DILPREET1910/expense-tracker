import 'package:expense_tracker/services/showDialog/addCategory.dart';
import 'package:flutter/material.dart';

//lib imports
import 'package:expense_tracker/services/firebaseRealtimeDatabase.dart';

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
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return const Text("this");
              },
            ),
          ),
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
