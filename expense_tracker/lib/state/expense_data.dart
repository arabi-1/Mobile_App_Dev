import 'package:flutter/material.dart';

import '../models/transaction_item.dart';

class ExpenseData extends ChangeNotifier {
  List<TransactionItem> overallExpenseList = [
    TransactionItem(
      name: "Pet Care",
      amount: "178",
      color: const Color(0xFF64B5F6),
    ),
    TransactionItem(
      name: "Coffee",
      amount: "450",
      color: const Color(0xFF81C784),
    ),
    TransactionItem(
      name: "House Repair",
      amount: "75",
      color: const Color(0xFFFF8A65),
    ),
  ];

  double getTotalAmount() {
    double total = 0;
    for (var item in overallExpenseList) {
      total += double.tryParse(item.amount) ?? 0;
    }
    return total;
  }

  void addNewExpense(String newName, String newAmount) {
    List<Color> colors = [
      const Color(0xFF64B5F6),
      const Color(0xFF81C784),
      const Color(0xFFFF8A65),
      Colors.purpleAccent,
      Colors.amber,
    ];

    overallExpenseList.add(
      TransactionItem(
        name: newName,
        amount: newAmount,
        color: colors[overallExpenseList.length % colors.length],
      ),
    );
    notifyListeners();
  }

  void deleteExpense(TransactionItem item) {
    overallExpenseList.remove(item);
    notifyListeners();
  }
}
