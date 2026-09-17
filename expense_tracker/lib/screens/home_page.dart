import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/expense_data.dart';
import '../utils/currency_formatter.dart';
import '../widgets/expense_chart.dart';
import '../widgets/transaction_list.dart';
import 'add_transaction_page.dart';

/// Responsibility: compose the home screen from state and presentation
/// modules.
/// Public contract: provides the [HomePage] route widget.
/// Boundary: does not render chart/list internals or mutate state directly.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Track your expenses",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),
              ExpenseChart(
                expenses: value.expenses,
                totalAmount: value.getTotalAmount(),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Text(
                      "Day",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Total: ${formatRupees(value.getTotalAmount())}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(height: 1),
              ),
              const SizedBox(height: 20),
              TransactionList(
                expenses: value.expenses,
                onDelete: value.deleteExpense,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AddTransactionPage(onSave: value.addNewExpense),
              ),
            );
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
