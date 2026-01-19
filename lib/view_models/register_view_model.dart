import 'package:flutter/material.dart';
import '../data/security_questions.dart';
import '../models/security_questions_model.dart';
import '../repositories/account_repository.dart';

class RegisterViewModel extends ChangeNotifier {
  final AccountRepository _accountRepository;
  RegisterViewModel(this._accountRepository);

  bool _isLoading = false;
  String? _errorMessage;

  List<SecurityQuestion> _questions = [];
  SecurityQuestion? _selectedQuestion;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<SecurityQuestion> get questions => _questions;
  SecurityQuestion? get selectedQuestion => _selectedQuestion;

  void loadSecurityQuestions() {
    _questions = securityQuestions;
    notifyListeners();
  }

  void selectQuestion(SecurityQuestion question) {
    _selectedQuestion = question;
    notifyListeners();
  }

  Future<bool> register({
    required String associationName,
    required String mobileNumber,
    required String pin,
    required SecurityQuestion securityQuestion,
    required String securityAnswer,
  }) async {
    _setLoading(true);
    _errorMessage = null;

    try {
      // Check for duplicate mobile number
      final existingAccount = await _accountRepository.getAccountByMobile(
        mobileNumber,
      );
      if (existingAccount != null) {
        _errorMessage = 'Mobile number already registered';
        return false;
      }

      // Register new account
      final account = await _accountRepository.register(
        associationName: associationName,
        mobileNumber: mobileNumber,
        pin: pin,
      );

      // Save security question and answer
      await _accountRepository.saveSecurityAnswer(
        accountId: account.id,
        securityQuestionId: securityQuestion.id,
        answer: securityAnswer,
      );

      return true;
    } catch (_) {
      _errorMessage = 'Unable to create account';
      return false;
    } finally {
      _setLoading(false);
    }
  }

  void clearAll() {
    _selectedQuestion = null;
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
