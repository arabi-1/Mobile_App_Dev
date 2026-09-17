import 'package:flutter/material.dart';

/// Responsibility: represent one expense in the domain model.
/// Public contract: immutable [name], [amount], and [color] values.
/// Boundary: does not manage collections, persistence, notifications, or UI.
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
