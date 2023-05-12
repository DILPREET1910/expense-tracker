import 'dart:convert';

import 'package:expense_tracker/api/Google%20Sheets/user_sheet_api.dart';

class DataFields {
  static dataEntry(
      String date, String category, String amount, String description) {
    List<String> data = [date, category, description, amount];
    UserSheetsApi.insert(data);
  }
}

class UserFields {
  static const String date = 'Date';
  static const String category = 'Category';
  static const String description = 'Description (if any)';
  static const String amount = 'Amount';

  static List<String> getFields() => [date, category, description, amount];
}

class User {
  final String date;
  final String category;
  final String? description;
  final String amount;

  const User(
      {required this.date,
      required this.category,
      this.description,
      required this.amount});

  static User fromJson(Map<String, dynamic>? json) => User(
      date: json?[UserFields.date],
      category: json?[UserFields.category],
      description: json?[UserFields.description],
      amount: json?[UserFields.amount]);
}
