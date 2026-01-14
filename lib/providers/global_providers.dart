import '../repositories/account_repository.dart';
import '../services/db_service.dart';

class GlobalProviders {
  static late final AccountRepository accountRepository;

  static Future<void> init() async {
    final db = await DBService().database;
    accountRepository = AccountRepository(db);
  }
}
