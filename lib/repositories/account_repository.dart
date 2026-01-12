import 'package:sqflite/sqflite.dart';
import '../helpers/date_helper.dart';
import '../helpers/hash_helper.dart';
import '../models/account_model.dart';

class AccountRepository {
  final Database db;
  AccountRepository(this.db);

  // Login account
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

  // Register account
  Future<AccountModel> register({
    required String associationName,
    required String mobileNumber,
    required String pin,
  }) async {
    final pinHash = hashValue(pin);
    final now = DateHelper.now();

    final id = await db.insert('accounts', {
      'association_name': associationName,
      'mobile_number': mobileNumber,
      'pin': pinHash,
      'created_at': now,
      'updated_at': now,
    });

    final result = await db.query(
      'accounts',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    return AccountModel.fromMap(result.first);
  }
}
