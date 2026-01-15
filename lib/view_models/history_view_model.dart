import 'package:flutter/material.dart';
import '../repositories/product_repository.dart';

class HistoryViewModel extends ChangeNotifier {
  final ProductRepository repo;

  List<String> categories = [];
  String? selectedCategory;
  bool isLoading = true;

  HistoryViewModel(this.repo) {
    loadCategories();
  }

  Future<void> loadCategories() async {
    isLoading = true;
    notifyListeners();

    categories = await repo.getCategories();
    if (categories.isNotEmpty) selectedCategory = categories[0];

    isLoading = false;
    notifyListeners();
  }

  void selectCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }
}
