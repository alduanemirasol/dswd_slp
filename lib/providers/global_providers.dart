import 'package:flutter/material.dart';

import '../services/db_service.dart';
import '../repositories/product_repository.dart';
import '../repositories/account_repository.dart';
import '../view_models/account_view_model.dart';
import '../view_models/history_view_model.dart';

class GlobalProviders {
  static late final AccountRepository accountRepository;
  static late final AccountViewModel accountViewModel;

  static late final ProductRepository productRepository;
  static late final HistoryViewModel historyViewModel;

  static Future<void> initialize() async {
    debugPrint('[GlobalProviders] Initializing database...');
    final db = await DBService().database;
    debugPrint('[GlobalProviders] Database initialized at path: ${db.path}');

    // Account
    accountRepository = AccountRepository(db);
    debugPrint('[GlobalProviders] AccountRepository initialized');

    accountViewModel = AccountViewModel(accountRepository);
    debugPrint('[GlobalProviders] AccountViewModel initialized');

    // Product / History
    productRepository = ProductRepository(db);
    debugPrint('[GlobalProviders] ProductRepository initialized');

    historyViewModel = HistoryViewModel(productRepository);
    debugPrint('[GlobalProviders] HistoryViewModel initialized');

    // Optional: print categories to check
    final categories = await productRepository.getCategories();
    debugPrint('[GlobalProviders] Loaded categories: $categories');
  }
}

/*
final accountVM = GlobalProviders.accountViewModel;

// Example login
await accountVM.login('09123456789', '1234');

// Listen for changes (if using ChangeNotifier)
accountVM.addListener(() {
  // rebuild UI
});

*/
