import 'package:flutter/material.dart';

class Treatment {
  final String name;
  final int maleCount;
  final int femaleCount;

  Treatment({
    required this.name,
    required this.maleCount,
    required this.femaleCount,
  });
}

class TreatmentProvider with ChangeNotifier {
  final List<Treatment> _treatments = [];

  List<Treatment> get treatments => _treatments;

  void addTreatment(Treatment treatment) {
    _treatments.add(treatment);
    notifyListeners();
  }

  void editTreatment(int index, Treatment treatment) {
    _treatments[index] = treatment;
    notifyListeners();
  }

  void removeTreatment(int index) {
    _treatments.removeAt(index);
    notifyListeners();
  }
}
