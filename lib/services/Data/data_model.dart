import 'package:expense_tracker/api/Google%20Sheets/user_sheet_api.dart';

class DataFields {
  static dataEntry(
      String date, String category, String amount, String description) {
    List<String> data = [date, category, description, amount];
    UserSheetsApi.insert(data);
  }
}
