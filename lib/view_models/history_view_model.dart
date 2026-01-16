import 'package:flutter/material.dart';

class HistoryViewModel extends ChangeNotifier {
  List<String> categories = ['All', 'Sales', 'Expenses', 'Capital'];
  String selectedCategory = 'All';
  bool isLoading = false;

  void selectCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }
}
