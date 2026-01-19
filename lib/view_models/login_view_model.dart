import 'package:flutter/material.dart';
import '../repositories/account_repository.dart';
import '../helpers/account_session_helper.dart';

class LoginViewModel extends ChangeNotifier {
  final AccountRepository _accountRepository;
  LoginViewModel(this._accountRepository);

  String _pin = '';
  int? _accountId;
  String? _mobileNumber;
  String? errorMessage;

  int get pinLength => _pin.length;
  int? get accountId => _accountId;
  String? get savedMobileNumber => _mobileNumber;

  void addDigit(String digit) {
    if (_pin.length < 4) {
      _pin += digit;
      notifyListeners();
    }
  }

  void removeDigit() {
    if (_pin.isNotEmpty) {
      _pin = _pin.substring(0, _pin.length - 1);
      notifyListeners();
    }
  }

  void clearPin() {
    _pin = '';
    notifyListeners();
  }

  void resetError() {
    errorMessage = null;
    notifyListeners();
  }

  Future<bool> login(String mobileNumber) async {
    resetError();
    try {
      final account = await _accountRepository.login(mobileNumber, _pin);
      if (account == null) {
        errorMessage = 'Invalid PIN';
        notifyListeners();
        return false;
      }

      await AccountSession.setAccountId(account.id);
      _accountId = account.id;
      _mobileNumber = mobileNumber;
      notifyListeners();
      return true;
    } catch (e) {
      errorMessage = 'Login failed: ${e.toString()}';
      notifyListeners();
      return false;
    } finally {
      clearPin();
    }
  }

  Future<void> loadSavedAccount() async {
    _accountId = await AccountSession.getAccountId();
    if (_accountId != null) {
      _mobileNumber = await _accountRepository.getMobileNumber(_accountId!);
    }
    notifyListeners();
  }

  Future<void> updateMobileNumber(String newNumber) async {
    _mobileNumber = newNumber;
    notifyListeners();
    if (_accountId != null) {
      await AccountSession.setAccountId(_accountId!);
    }
  }
}
