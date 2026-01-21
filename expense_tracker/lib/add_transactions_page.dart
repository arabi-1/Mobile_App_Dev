import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'expense_data.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  // 1. Create controllers to capture user input
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // The "Back" arrow is added automatically by Flutter!
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Add Expense",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to left
          children: [
            const Text(
              "NAME",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 10),

            // --- INPUT 1: NAME ---
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "e.g. Coffee",
                filled: true,
                fillColor: Colors.grey[100], // Subtle grey background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none, // No hard black lines
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "AMOUNT",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 10),

            // --- INPUT 2: AMOUNT ---
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number, // Shows number pad
              decoration: InputDecoration(
                hintText: "e.g. 500",
                prefixText: "Rs ", // Automatically adds currency symbol
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const Spacer(), // Pushes button to bottom
            // --- SAVE BUTTON ---
            SizedBox(
              width: double.infinity, // Makes button full width
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      amountController.text.isNotEmpty) {
                    // 1. TALK TO THE BRAIN (Provider)
                    Provider.of<ExpenseData>(
                      context,
                      listen: false,
                    ).addNewExpense(nameController.text, amountController.text);

                    // 2. CLOSE THE PAGE
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Dark button like design
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "SAVE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Bottom safe area space
          ],
        ),
      ),
    );
  }
}
