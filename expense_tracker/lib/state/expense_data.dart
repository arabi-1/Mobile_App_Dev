import 'package:flutter/material.dart';

import '../models/transaction_item.dart';

/// Owns the expense collection and notifies listeners after mutations.
///
/// [expenses] is an unmodifiable snapshot view. [getTotalAmount] returns the
/// numeric sum, treating nonnumeric amounts as zero. [addNewExpense] accepts
/// the supplied strings without additional validation, and [deleteExpense]
/// removes a matching item if present; both methods notify listeners even when
/// deletion finds no matching item.
class ExpenseData extends ChangeNotifier {
  static const List<Color> _expenseColors = [
    Color(0xFF64B5F6),
    Color(0xFF81C784),
    Color(0xFFFF8A65),
    Colors.purpleAccent,
    Colors.amber,
  ];

  final List<TransactionItem> _expenses = [
    TransactionItem(name: "Pet Care", amount: "178", color: _expenseColors[0]),
    TransactionItem(name: "Coffee", amount: "450", color: _expenseColors[1]),
    TransactionItem(
      name: "House Repair",
      amount: "75",
      color: _expenseColors[2],
    ),
  ];

  List<TransactionItem> get expenses => List.unmodifiable(_expenses);

  double getTotalAmount() {
    double totalAmount = 0;
    for (final expense in _expenses) {
      totalAmount += expense.numericAmount;
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
