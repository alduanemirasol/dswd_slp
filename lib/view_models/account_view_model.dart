import 'package:flutter/material.dart';

class AccountViewModel extends ChangeNotifier {
  int? _accountId;
  int? get accountId => _accountId;

  String? _mobileNumber;
  String? get mobileNumber => _mobileNumber;

  void setAccount({required int id, required String mobile}) {
    _accountId = id;
    _mobileNumber = mobile;
    notifyListeners();
  }

  void clear() {
    _accountId = null;
    _mobileNumber = null;
    notifyListeners();
  }

  bool get isLoggedIn => _accountId != null;
}
