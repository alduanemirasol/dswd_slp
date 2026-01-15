import 'package:flutter/foundation.dart';
import '../helpers/account_session.dart';
import '../repositories/account_repository.dart';

class AccountViewModel extends ChangeNotifier {
  final AccountRepository accountRepository;

  int? accountId;
  String? mobileNumber;

  AccountViewModel(this.accountRepository);

  // Initialize on app start
  Future<void> initialize() async {
    accountId = await AccountSession.getAccountId();
    if (accountId != null) {
      mobileNumber = await accountRepository.getMobileNumber(accountId!);
    }
    notifyListeners();
  }

  // Optional: fetch manually anytime
  Future<void> loadMobileNumber() async {
    if (accountId == null) return;
    mobileNumber = await accountRepository.getMobileNumber(accountId!);
    notifyListeners();
  }
}
