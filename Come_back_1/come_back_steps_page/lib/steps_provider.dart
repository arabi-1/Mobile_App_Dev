import 'package:flutter/material.dart';

class StepsProvider extends ChangeNotifier {
  // 1. PRIVATE DATA (The Source of Truth)
  int _steps = 2763;
  int _yesterdaySteps = 2000; // Hardcoded for comparison

  // 2. GETTERS (How the UI reads the data)
  int get steps => _steps;

  // 3. COMPUTED PROPERTY (The Logic)
  // The UI just asks for 'statusWord', and this calculates the answer instantly.
  String get statusWord {
    if (_steps >= _yesterdaySteps) {
      return "better";
    } else {
      return "lower";
    }
  }

  // // Optional: Dynamic Color logic
  // Color get statusColor {
  //   return _steps >= _yesterdaySteps ? Colors.pinkAccent : Colors.orange;
  // }

  // 4. METHODS (How we change data)
  void incrementSteps() {
    _steps += 50; // Add steps
    notifyListeners(); // <--- The most important line! Updates the screen.
  }
}
