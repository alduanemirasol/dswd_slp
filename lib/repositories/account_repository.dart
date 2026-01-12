import 'package:sqflite/sqflite.dart';
import '../helpers/date_helper.dart';
import '../helpers/hash_helper.dart';
import '../models/account_model.dart';

class AccountRepository {
  final Database db;
  AccountRepository(this.db);

  // Login with mobile number and PIN
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

  // Register new account
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

  // Reset PIN
  Future<bool> resetPin({
    required String mobileNumber,
    required String newPin,
  }) async {
    final pinHash = hashValue(newPin);
    final now = DateHelper.now();

    final updated = await db.update(
      'accounts',
      {'pin': pinHash, 'updated_at': now},
      where: 'mobile_number = ?',
      whereArgs: [mobileNumber],
    );

    return updated > 0;
  }
}
