import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/transaction_item.dart';
import '../state/expense_data.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final expenseData = Provider.of<ExpenseData>(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: expenseData.overallExpenseList.length,
      itemBuilder: (context, index) {
        TransactionItem item = expenseData.overallExpenseList[index];

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
            Provider.of<ExpenseData>(
              context,
              listen: false,
            ).deleteExpense(item);
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
                  "Rs ${item.amount}/-",
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
