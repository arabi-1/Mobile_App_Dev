import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/expense_data.dart';
import '../utils/currency_formatter.dart';
import '../widgets/expense_chart.dart';
import '../widgets/transaction_list.dart';
import 'add_transaction_page.dart';

/// Composes the expense chart, summary, list, and add-expense navigation.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const double _chartTopSpacing = 25;
  static const double _summarySpacing = 40;
  static const double _summaryHorizontalPadding = 20;
  static const double _dividerSpacing = 10;
  static const double _listTopSpacing = 20;

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, expenseData, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: _buildBody(expenseData),
        floatingActionButton: _buildAddExpenseButton(context, expenseData),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
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
    );
  }

  Widget _buildBody(ExpenseData expenseData) {
    final totalAmount = expenseData.getTotalAmount();

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: _chartTopSpacing),
          ExpenseChart(
            expenses: expenseData.expenses,
            totalAmount: totalAmount,
          ),
          const SizedBox(height: _summarySpacing),
          _buildSummary(totalAmount),
          const SizedBox(height: _dividerSpacing),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _summaryHorizontalPadding,
            ),
            child: Divider(height: 1),
          ),
          const SizedBox(height: _listTopSpacing),
          TransactionList(
            expenses: expenseData.expenses,
            onDelete: expenseData.deleteExpense,
          ),
        ],
      ),
    );
  }

  Widget _buildSummary(double totalAmount) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _summaryHorizontalPadding,
      ),
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
            'Total: ${formatRupees(totalAmount)}',
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddExpenseButton(BuildContext context, ExpenseData expenseData) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                AddTransactionPage(onSave: expenseData.addNewExpense),
          ),
        );
      },
      backgroundColor: Colors.black,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
