import '../services/db_service.dart';
import '../repositories/product_repository.dart';
import '../repositories/account_repository.dart';
import '../view_models/account_view_model.dart';
import '../view_models/history_view_model.dart';
import '../view_models/login_view_model.dart';
import '../view_models/register_view_model.dart';

class GlobalProviders {
  static late final AccountRepository accountRepository;
  static late final ProductRepository productRepository;

  static late final AccountViewModel accountViewModel;
  static late final LoginViewModel loginViewModel;
  static late final RegisterViewModel registerViewModel;
  static late final HistoryViewModel historyViewModel;

  static Future<void> initialize() async {
    final db = await DBService().database;

    accountRepository = AccountRepository(db);
    productRepository = ProductRepository(db);

    accountViewModel = AccountViewModel(accountRepository);
    loginViewModel = LoginViewModel(accountRepository);
    registerViewModel = RegisterViewModel(accountRepository);
    historyViewModel = HistoryViewModel();
  }
}
