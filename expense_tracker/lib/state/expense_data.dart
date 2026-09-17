import 'package:flutter/material.dart';

import '../models/transaction_item.dart';

/// Responsibility: own the expense collection and publish state changes.
/// Public contract: [expenses], [getTotalAmount], [addNewExpense], and
/// [deleteExpense].
/// Boundary: does not build widgets or expose a mutable collection to callers.
class ExpenseData extends ChangeNotifier {
  final List<TransactionItem> _expenses = [
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

  List<TransactionItem> get expenses => List.unmodifiable(_expenses);

  double getTotalAmount() {
    double total = 0;
    for (var item in _expenses) {
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

    _expenses.add(
      TransactionItem(
        name: newName,
        amount: newAmount,
        color: colors[_expenses.length % colors.length],
      ),
    );
    notifyListeners();
  }

  void deleteExpense(TransactionItem item) {
    _expenses.remove(item);
    notifyListeners();
  }
}
