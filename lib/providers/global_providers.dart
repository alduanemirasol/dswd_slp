import '../services/db_service.dart';
import '../repositories/account_repository.dart';
import '../view_models/account_view_model.dart';

class GlobalProviders {
  static late final AccountRepository accountRepository;
  static late final AccountViewModel accountViewModel;

  static Future<void> initialize() async {
    final db = await DBService().database;
    accountRepository = AccountRepository(db);
    accountViewModel = AccountViewModel(accountRepository);
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
