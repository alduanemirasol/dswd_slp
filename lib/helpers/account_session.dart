import 'package:shared_preferences/shared_preferences.dart';

class AccountSession {
  static const _storageKeyAccountId = 'account_id';
  static int? _currentAccountId;

  // Save account id
  static Future<void> setAccountId(int accountId) async {
    _currentAccountId = accountId;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_storageKeyAccountId, accountId);
  }

  // Get account id
  static Future<int?> getAccountId() async {
    if (_currentAccountId != null) return _currentAccountId;
    final prefs = await SharedPreferences.getInstance();
    _currentAccountId = prefs.getInt(_storageKeyAccountId);
    return _currentAccountId;
  }

  // Clear account id
  static Future<void> clearAccountId() async {
    _currentAccountId = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKeyAccountId);
  }

  // Access account ID only in memory
  static int? get currentAccountId => _currentAccountId;
}
