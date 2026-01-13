import 'package:flutter/material.dart';
import '../repositories/account_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AccountRepository _accountRepository;

  LoginViewModel({required AccountRepository accountRepository})
    : _accountRepository = accountRepository;

  // Current PIN input
  String _pin = '';

  // Expose PIN length for UI
  int get pinLength => _pin.length;

  // Error message for login failure
  String? errorMessage;

  /// Add a digit to the PIN
  void addDigit(String digit) {
    if (_pin.length < 4) {
      _pin += digit;
      notifyListeners();
    }
  }

  /// Remove the last digit from the PIN
  void removeDigit() {
    if (_pin.isNotEmpty) {
      _pin = _pin.substring(0, _pin.length - 1);
      notifyListeners();
    }
  }

  /// Clear the PIN input
  void clearPin() {
    _pin = '';
    notifyListeners();
  }

  /// Clear the error message
  void resetError() {
    errorMessage = null;
    notifyListeners();
  }

  /// Attempt to login with the provided mobile number
  Future<bool> login(String mobileNumber) async {
    resetError();

    try {
      final account = await _accountRepository.login(mobileNumber, _pin);
      if (account == null) {
        errorMessage = 'Invalid PIN';
        notifyListeners();
        return false;
      }
      return true;
    } catch (e) {
      errorMessage = 'Login failed: ${e.toString()}';
      notifyListeners();
      return false;
    } finally {
      clearPin();
    }
  }
}
