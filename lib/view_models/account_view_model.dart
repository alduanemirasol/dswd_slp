import 'package:flutter/foundation.dart';
import '../helpers/account_session.dart';
import '../repositories/account_repository.dart';

class AccountViewModel extends ChangeNotifier {
  final AccountRepository accountRepository;

  String? mobileNumber;

  AccountViewModel(this.accountRepository);

  /// Initialize on app start
  Future<void> initialize() async {
    // Fetch mobile number for the currently logged-in account
    mobileNumber = await accountRepository.getMobileNumber();
    notifyListeners();
  }

  /// Optional: fetch manually anytime
  Future<void> loadMobileNumber() async {
    mobileNumber = await accountRepository.getMobileNumber();
    notifyListeners();
  }
}
