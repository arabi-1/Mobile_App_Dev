import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/expense_data.dart';

class ExpenseChart extends StatelessWidget {
  const ExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    final expenseData = Provider.of<ExpenseData>(context);

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
              sections: expenseData.overallExpenseList
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
                "Rs ${expenseData.getTotalAmount().toStringAsFixed(0)}",
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
