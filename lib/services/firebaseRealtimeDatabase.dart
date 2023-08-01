//firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RealTimeDatabase {
  final FirebaseDatabase realtimeDatabase = FirebaseDatabase.instance;
  final userUID = FirebaseAuth.instance.currentUser?.uid;

  Future<void> addDataEntry(
      String date, String category, String amount, String description) async {
    try {
      await realtimeDatabase.ref("$userUID/").set({
        "date": date,
        "category": category,
        "amount": amount,
        "description": description,
      });
    } on FirebaseException catch (error) {
      print("Error while data entry : $error");
    }
  }
}
