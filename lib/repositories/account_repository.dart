import 'package:sqflite/sqflite.dart';
import '../helpers/date_helper.dart';
import '../helpers/hash_helper.dart';
import '../models/account_model.dart';

class AccountRepository {
  final Database db;
  AccountRepository(this.db);

  // Get mobile number
  Future<String?> getMobileNumber(int accountId) async {
    final result = await db.query(
      'accounts',
      columns: ['mobile_number'],
      where: 'id = ?',
      whereArgs: [accountId],
      limit: 1,
    );

    if (result.isEmpty) return null;
    return result.first['mobile_number'] as String;
  }

  // Check if mobile number already exists
  Future<AccountModel?> getAccountByMobile(String mobileNumber) async {
    final result = await db.query(
      'accounts',
      where: 'mobile_number = ?',
      whereArgs: [mobileNumber],
      limit: 1,
    );

    if (result.isEmpty) return null;
    return AccountModel.fromMap(result.first);
  }

  // Login
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

  // Save security question and answer
  Future<void> saveSecurityAnswer({
    required int accountId,
    required int securityQuestionId,
    required String answer,
  }) async {
    await db.insert('account_security_answers', {
      'account_id': accountId,
      'security_question_id': securityQuestionId,
      'answer': answer,
      'created_at': DateHelper.now(),
    });
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
