import 'package:sqflite/sqflite.dart';
import '../helpers/hash_helper.dart';
import '../models/account_model.dart';

class AccountRepository {
  final Database db;
  AccountRepository(this.db);

  Future<AccountModel?> login(String mobileNumber, String pin) async {
    final pinHash = hashValue(pin);
    final result = await db.query(
      'accounts',
      where: 'mobile_number = ? AND pin = ?',
      whereArgs: [mobileNumber, pinHash],
      limit: 1,
    );

    if (result.isEmpty) return null;
    return AccountModel.fromMap(result.first);
  }
}
