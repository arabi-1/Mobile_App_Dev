import 'package:flutter/material.dart';

// 1. Define what a "Transaction" is
class TransactionItem {
  final String name;
  final String amount;
  final Color color;

  TransactionItem({
    required this.name,
    required this.amount,
    required this.color,
  });
}

// 2. Create the Provider Class
class ExpenseData extends ChangeNotifier {
  // The List (Source of Truth)
  List<TransactionItem> overallExpenseList = [
    // Default data
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

  // Helper to get total amount
  double getTotalAmount() {
    double total = 0;
    for (var item in overallExpenseList) {
      total += double.tryParse(item.amount) ?? 0;
    }
    return total;
  }

  // ADD NEW ITEM
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

  // DELETE ITEM (This is the missing part!)
  void deleteExpense(TransactionItem item) {
    overallExpenseList.remove(item);
    notifyListeners();
  }
}
