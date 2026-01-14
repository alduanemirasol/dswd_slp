import '../repositories/account_repository.dart';
import '../services/db_service.dart';

class GlobalProviders {
  // Global instances
  static late final AccountRepository accountRepository;

  static Future<void> init() async {
    // Initialize db
    final db = await DBService().database;

    // Initialize repositories
    accountRepository = AccountRepository(db);
  }
}
