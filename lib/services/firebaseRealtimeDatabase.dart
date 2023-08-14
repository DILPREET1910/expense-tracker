//lib imports
import 'package:expense_tracker/services/singleDataEntry.dart';

//firebase imports
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RealTimeDatabase {
  final FirebaseDatabase realtimeDatabase = FirebaseDatabase.instance;
  final userUID = FirebaseAuth.instance.currentUser?.uid;

  Future<void> addDataEntry(
      DateTime date, String category, double amount, String description) async {
    SingleDataEntry singleDataEntry = SingleDataEntry();
    try {
      await realtimeDatabase.ref("$userUID/DataEntries/").set(singleDataEntry
          .singleJsonDataEntry(date, category, amount, description));
    } on FirebaseException catch (error) {
      print("Error while data entry : $error");
    }
  }

  Future<void> addCategories(String category) async {
    DatabaseReference databaseReference =
        realtimeDatabase.ref("$userUID/Categories/");
    DatabaseReference postReference = databaseReference.push();

    try {
      await postReference.set(category);
    } on FirebaseException catch (error) {
      print("Error while adding new category : $error");
    }
  }

  Future<void> getCategories() async {
    try {
      DataSnapshot categories =
          await realtimeDatabase.ref("$userUID/categories/").get();
    } on FirebaseException catch (error) {
      print("Error while getting Categories : $error");
    }
  }
}
