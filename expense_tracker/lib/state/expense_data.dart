import 'package:flutter/material.dart';

import '../models/transaction_item.dart';

/// Stores expenses, calculates totals, and notifies listeners after mutations.
class ExpenseData extends ChangeNotifier {
  static const List<Color> _expenseColors = [
    Color(0xFF64B5F6),
    Color(0xFF81C784),
    Color(0xFFFF8A65),
    Colors.purpleAccent,
    Colors.amber,
  ];

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
    double totalAmount = 0;
    for (final expense in _expenses) {
      totalAmount += double.tryParse(expense.amount) ?? 0;
    }
    return totalAmount;
  }

  void addNewExpense(String newName, String newAmount) {
    _expenses.add(
      TransactionItem(
        name: newName,
        amount: newAmount,
        color: _expenseColors[_expenses.length % _expenseColors.length],
      ),
    );
    notifyListeners();
  }

  void deleteExpense(TransactionItem item) {
    _expenses.remove(item);
    notifyListeners();
  }
}
