import 'package:provider/provider.dart';
import '../repositories/account_repository.dart';
import '../services/db_service.dart';

List<Provider> globalProviders() {
  return [
    Provider<AccountRepository>(
      create: (_) => AccountRepository(DBService().databaseInstance),
    ),
  ];
}
