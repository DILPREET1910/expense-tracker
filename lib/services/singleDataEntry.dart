class SingleDataEntry {
  Map<String, Object> singleJsonDataEntry(
      String date, String category, String amount, String description) {
    return {
      "date": date,
      "category": category,
      "amount": amount,
      "description": description
    };
  }
}
