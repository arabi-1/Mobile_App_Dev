import 'package:flutter/material.dart';

import '../models/transaction_item.dart';
import '../utils/currency_formatter.dart';

/// Responsibility: render expenses and handle dismiss gestures.
/// Public contract: accepts [expenses] and calls [onDelete] for a dismissed
/// item.
/// Boundary: does not own expense state or decide how deletion is persisted.
class TransactionList extends StatelessWidget {
  const TransactionList({
    required this.expenses,
    required this.onDelete,
    super.key,
  });

  final List<TransactionItem> expenses;
  final ValueChanged<TransactionItem> onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        final item = expenses[index];

        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          background: Container(
            margin: const EdgeInsets.only(bottom: 15, right: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            onDelete(item);
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const Spacer(),
                Text(
                  formatRupees(item.amount, suffix: '/-'),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
