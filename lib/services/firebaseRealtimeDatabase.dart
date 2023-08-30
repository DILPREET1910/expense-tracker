//lib imports
import 'package:expense_tracker/services/singleDataEntry.dart';

//firebase imports
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RealTimeDatabase {
  final FirebaseDatabase realtimeDatabase = FirebaseDatabase.instance;
  final userUID = FirebaseAuth.instance.currentUser?.uid;

  //add single data entry
  Future<void> addDataEntry(
      String date, String category, double amount, String description) async {
    SingleDataEntry singleDataEntry = SingleDataEntry();

    DatabaseReference databaseReference =
        realtimeDatabase.ref("$userUID/DataEntries/");
    DatabaseReference postReference = databaseReference.push();
    try {
      await postReference.set(singleDataEntry.singleJsonDataEntry(
          date, category, amount, description));
    } on FirebaseException catch (error) {
      print("Error while single data entry : $error");
    }
  }

  //get list of data entries
  Future<DataSnapshot?> getDataEntries() async {
    try {
      return await realtimeDatabase.ref("$userUID/DataEntries/").get();
    } on FirebaseException catch (error) {
      print("Error while getting Data Entries : $error");
    }
    return null;
  }

  //add new category
  Future<void> addCategories(String category, secondSetState) async {
    DatabaseReference databaseReference =
        realtimeDatabase.ref("$userUID/Categories/");
    DatabaseReference postReference = databaseReference.push();

    try {
      await postReference.set(category);
      secondSetState(() {});
    } on FirebaseException catch (error) {
      print("Error while adding new category : $error");
    }
  }

  //add new category without setState
  Future<void> addCategories1(String category) async {
    DatabaseReference databaseReference =
        realtimeDatabase.ref("$userUID/Categories/");
    DatabaseReference postReference = databaseReference.push();

    try {
      await postReference.set(category);
    } on FirebaseException catch (error) {
      print("Error while adding new category : $error");
    }
  }

  //delete category
  Future<void> removeCategory(String category, secondSetState) async {
    DatabaseReference databaseReference =
        realtimeDatabase.ref("$userUID/Categories/");
    try {
      await databaseReference.child(category).remove();
      secondSetState(() {});
      print("delete kiya");
    } on FirebaseException catch (error) {
      print("Error while remove the category : $error");
    }
  }

  //get list of categories
  Future<DataSnapshot?> getCategories() async {
    try {
      return await realtimeDatabase.ref("$userUID/Categories/").get();
    } on FirebaseException catch (error) {
      print("Error while getting Categories : $error");
    }
    return null;
  }
}
