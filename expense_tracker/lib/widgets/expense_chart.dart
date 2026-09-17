import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/transaction_item.dart';
import '../utils/currency_formatter.dart';

/// Displays the expense distribution and the current total amount.
class ExpenseChart extends StatelessWidget {
  const ExpenseChart({
    required this.expenses,
    required this.totalAmount,
    super.key,
  });

  final List<TransactionItem> expenses;
  final double totalAmount;

  static const double _chartHeight = 200;
  static const double _centerSpaceRadius = 70;
  static const double _sectionRadius = 35;
  static const double _sectionSpacing = 4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _chartHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [_buildPieChart(), _buildTotalLabel()],
      ),
    );
  }

  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sectionsSpace: _sectionSpacing,
        centerSpaceRadius: _centerSpaceRadius,
        startDegreeOffset: 270,
        sections: expenses
            .map(
              (expense) => PieChartSectionData(
                color: expense.color,
                value: double.tryParse(expense.amount) ?? 0,
                showTitle: false,
                radius: _sectionRadius,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildTotalLabel() {
    return Column(
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
    );
  }
}
