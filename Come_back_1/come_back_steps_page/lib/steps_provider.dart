import 'package:flutter/material.dart';

class StepsProvider extends ChangeNotifier {
  // ---------------------------------------------------------
  // 1. PRIVATE STATE (The Data)
  // ---------------------------------------------------------
  int _steps = 0;
  int _weight_count = 0;
  int _stepGoal = 0;
  double _distanceKm = 0.0;
  int _calories = 23;
  int _waterMl = 0;

  // ---------------------------------------------------------
  // 2. GETTERS (Read-only access for your UI)
  // ---------------------------------------------------------
  int get steps => _steps;
  int get stepGoal => _stepGoal;
  double get distanceKm => _distanceKm;
  int get calories => _calories;
  int get waterMl => _waterMl;
  int get weight_count => _weight_count;

  // ---------------------------------------------------------
  // 3. MUTATORS (The Actions)
  // ---------------------------------------------------------

  // Action for when the user walks
  void addStep() {
    _steps++;

    // TODO: Calculate new distance based on steps (e.g., 1 step = 0.0008 km)
    // TODO: Calculate new calories based on steps (e.g., 1 step = 0.04 kcal)

    // NEVER FORGET THIS LINE:
    notifyListeners();
  }

  // Action for the 'add_outlined' button on your Water card
  void addWater() {
    _waterMl++;

    notifyListeners();
  }

  void countWeight() {
    _weight_count++;
    notifyListeners();
  }

  void updateStepGoal(int newGoal) {
    _stepGoal = newGoal;
    notifyListeners();
  }

  void updateDistance(double newDistance) {
    _distanceKm = newDistance;
    notifyListeners();
  }

  void updateKcal(int newKcal) {
    _calories = newKcal;
    notifyListeners();
  }
}
