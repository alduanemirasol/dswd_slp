import 'package:flutter/material.dart';
import '../models/account_model.dart';
import '../repositories/account_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AccountRepository accountRepository;
  LoginViewModel(this.accountRepository);

  AccountModel? _account;
  AccountModel? get account => _account;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> login(String mobileNumber, String pin) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await accountRepository.login(mobileNumber, pin);

      if (result != null) {
        _account = result;
      } else {
        _error = 'Invalid mobile number or PIN';
      }
    } catch (e) {
      _error = 'An unexpected error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _account = null;
    _error = null;
    _isLoading = false;
    notifyListeners();
  }
}
