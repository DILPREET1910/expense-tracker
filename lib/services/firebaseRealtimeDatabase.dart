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

  Future<DataSnapshot?> getCategories() async {
    try {
      return await realtimeDatabase.ref("$userUID/Categories/").get();
    } on FirebaseException catch (error) {
      print("Error while getting Categories : $error");
    }
    return null;
  }
}
