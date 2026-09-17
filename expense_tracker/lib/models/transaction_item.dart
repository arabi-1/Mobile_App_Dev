import 'package:flutter/material.dart';

/// A single expense with its display name, amount, and chart color.
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
