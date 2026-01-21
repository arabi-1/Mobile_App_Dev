import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // <--- FIXES "Consumer" error
import 'package:fl_chart/fl_chart.dart'; // <--- Needed for the graph
import 'expense_data.dart'; // <--- FIXES "TransactionItem" & "ExpenseData" errors
import 'add_transactions_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    // CONSUMER: This listens to changes in ExpenseData
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

              // --- 1. DYNAMIC PIE CHART ---
              SizedBox(
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 4,
                        centerSpaceRadius: 70,
                        startDegreeOffset: 270,
                        // MAP THE LIST TO SECTIONS AUTOMATICALLY
                        sections: value.overallExpenseList
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
                        // DYNAMIC TOTAL
                        Text(
                          "Rs ${value.getTotalAmount().toStringAsFixed(0)}",
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
              ),

              const SizedBox(height: 40),

              // --- 2. HEADER ---
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
                    // DYNAMIC HEADER TOTAL
                    Text(
                      'Total: Rs ${value.getTotalAmount().toStringAsFixed(0)}',
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

              // --- 3. DYNAMIC LIST ---
              // Use ListView.builder to automatically build rows from the list
              ListView.builder(
                shrinkWrap: true, // Important when inside a Column
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.overallExpenseList.length,
                itemBuilder: (context, index) {
                  // Get the specific item
                  TransactionItem item = value.overallExpenseList[index];

                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      margin: const EdgeInsets.only(
                        bottom: 15,
                        right: 20,
                      ), // Matches your card margin
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),

                    // WHAT HAPPENS WHEN SWIPED?
                    onDismissed: (direction) {
                      // Talk to the Brain to delete it
                      Provider.of<ExpenseData>(
                        context,
                        listen: false,
                      ).deleteExpense(item);
                    },

                    // YOUR ACTUAL CARD
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 15,
                        left: 20,
                        right: 20,
                      ),
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
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTransactionPage(),
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
