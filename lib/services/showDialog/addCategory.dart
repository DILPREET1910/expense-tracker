import 'package:flutter/material.dart';

//lib imports
import 'package:expense_tracker/services/firebaseRealtimeDatabase.dart';
import 'package:expense_tracker/widgets/textButton1.dart';

//google fonts imports
import 'package:google_fonts/google_fonts.dart';

TextEditingController newCategory = TextEditingController();

void addCategory(
    BuildContext context, RealTimeDatabase realTimeDatabase,secondSetState) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.grey[400],
          content: SizedBox(
            height: 140,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(width: 3, color: Colors.grey[900]!),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: newCategory,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          "new category",
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    WidgetsTextButton1(
                      onPressed: () {
                        Navigator.pop(context);
                        newCategory.clear();
                      },
                      label: 'cancel',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    WidgetsTextButton1(
                      onPressed: () {
                        Navigator.pop(context);
                        realTimeDatabase.addCategories(newCategory.text.trim(),secondSetState);
                        newCategory.clear();
                      },
                      label: "save",
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
