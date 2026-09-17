import 'package:flutter/material.dart';

/// Collects a name and amount, then submits them through [onSave].
class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({required this.onSave, super.key});

  final void Function(String name, String amount) onSave;

  static const double _pagePadding = 25;
  static const double _fieldSpacing = 10;
  static const double _sectionSpacing = 25;
  static const double _buttonHeight = 55;
  static const double _fieldRadius = 12;
  static const double _buttonRadius = 15;

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Add Expense",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AddTransactionPage._pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "NAME",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: AddTransactionPage._fieldSpacing),
            _buildTextField(
              controller: nameController,
              hintText: "e.g. Coffee",
            ),
            const SizedBox(height: AddTransactionPage._sectionSpacing),
            const Text(
              "AMOUNT",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: AddTransactionPage._fieldSpacing),
            _buildTextField(
              controller: amountController,
              hintText: "e.g. 500",
              keyboardType: TextInputType.number,
              prefixText: "Rs ",
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: AddTransactionPage._buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      amountController.text.isNotEmpty) {
                    widget.onSave(nameController.text, amountController.text);

                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AddTransactionPage._buttonRadius,
                    ),
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    String? prefixText,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        prefixText: prefixText,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AddTransactionPage._fieldRadius),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
