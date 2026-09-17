import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/transaction_item.dart';
import '../utils/currency_formatter.dart';

/// Responsibility: render the expense distribution pie chart and total.
/// Public contract: accepts only the [expenses] to plot and [totalAmount].
/// Boundary: does not read or mutate application state or handle navigation.
class ExpenseChart extends StatelessWidget {
  const ExpenseChart({
    required this.expenses,
    required this.totalAmount,
    super.key,
  });

  final List<TransactionItem> expenses;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 4,
              centerSpaceRadius: 70,
              startDegreeOffset: 270,
              sections: expenses
                  .map(
                    (item) => PieChartSectionData(
                      color: item.color,
                      value: double.tryParse(item.amount) ?? 0,
                      showTitle: false,
                      radius: 35,
                    ),
                  )
                  .toList(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Total Spent",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                formatRupees(totalAmount),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
