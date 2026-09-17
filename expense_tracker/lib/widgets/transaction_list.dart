import 'package:flutter/material.dart';

import '../models/transaction_item.dart';
import '../utils/currency_formatter.dart';

/// Displays expenses and reports dismissed expenses through [onDelete].
class TransactionList extends StatelessWidget {
  const TransactionList({
    required this.expenses,
    required this.onDelete,
    super.key,
  });

  final List<TransactionItem> expenses;
  final ValueChanged<TransactionItem> onDelete;

  static const double _itemSpacing = 15;
  static const double _itemRadius = 15;
  static const double _itemPadding = 16;
  static const double _textSize = 17;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return _buildDismissibleExpense(expenses[index]);
      },
    );
  }

  Widget _buildDismissibleExpense(TransactionItem expense) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: _buildDeleteBackground(),
      onDismissed: (direction) => onDelete(expense),
      child: _buildExpenseTile(expense),
    );
  }

  Widget _buildDeleteBackground() {
    return Container(
      margin: const EdgeInsets.only(bottom: _itemSpacing, right: 20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(_itemRadius),
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }

  Widget _buildExpenseTile(TransactionItem expense) {
    return Container(
      margin: const EdgeInsets.only(bottom: _itemSpacing, left: 20, right: 20),
      padding: const EdgeInsets.all(_itemPadding),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(_itemRadius),
      ),
      child: Row(
        children: [
          Text(
            expense.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _textSize,
            ),
          ),
          const Spacer(),
          Text(
            formatRupees(expense.amount, suffix: '/-'),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _textSize,
            ),
          ),
        ],
      ),
    );
  }
}
