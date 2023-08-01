class SingleDataEntry {
  Map<String, Object> singleJsonDataEntry(
      DateTime date, String category, double amount, String description) {
    return {
      "date": date,
      "category": category,
      "amount": amount,
      "description": description
    };
  }
}
