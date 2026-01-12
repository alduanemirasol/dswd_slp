import 'package:shared_preferences/shared_preferences.dart';

class AccountSession {
  static const _accountIdKey = 'account_id';

  // Save logged-in account ID
  static Future<void> saveAccountId(int accountId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_accountIdKey, accountId);
  }

  // Get saved account ID
  static Future<int?> getAccountId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_accountIdKey);
  }

  // Clear saved account ID
  static Future<void> clearAccountId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accountIdKey);
  }
}
