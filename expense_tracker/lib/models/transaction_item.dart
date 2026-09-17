import 'package:flutter/material.dart';

/// An expense value used by state and presentation modules.
///
/// [name] and [amount] are stored exactly as supplied. [color] identifies the
/// expense in charts. The model does not reject empty, negative, or nonnumeric
/// amounts; [ExpenseData] treats nonnumeric amounts as zero when totaling.
class TransactionItem {
  final String name;
  final String amount;
  final Color color;

  /// Returns the amount for numeric calculations, or zero when it is invalid.
  double get numericAmount => double.tryParse(amount) ?? 0;

  TransactionItem({
    required this.name,
    required this.amount,
    required this.color,
  });
}
