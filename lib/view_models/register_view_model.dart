import 'package:flutter/foundation.dart';
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

  bool validateFields({
    required String associationName,
    required String mobileNumber,
    required String pin,
    required SecurityQuestion? securityQuestion,
    required String securityAnswer,
  }) {
    if (associationName.trim().isEmpty) {
      return _setError("Association Name is required");
    }

    if (mobileNumber.trim().isEmpty) {
      return _setError("Mobile Number is required");
    }

    if (pin.trim().isEmpty) {
      return _setError("PIN is required");
    }

    if (securityQuestion == null) {
      return _setError("Security Question must be selected");
    }

    if (securityAnswer.trim().isEmpty) {
      return _setError("Security Answer is required");
    }

    _clearError();
    return true;
  }

  Future<bool> register({
    required String associationName,
    required String mobileNumber,
    required String pin,
    required SecurityQuestion? securityQuestion,
    required String securityAnswer,
  }) async {
    _setLoading(true);
    _clearError();

    if (!validateFields(
      associationName: associationName,
      mobileNumber: mobileNumber,
      pin: pin,
      securityQuestion: securityQuestion,
      securityAnswer: securityAnswer,
    )) {
      _setLoading(false);
      return false;
    }

    try {
      if (!await _checkDuplicateMobile(mobileNumber)) {
        _setError('Mobile number already registered');
        return false;
      }

      final account = await _createAccount(
        associationName: associationName,
        mobileNumber: mobileNumber,
        pin: pin,
      );

      await _saveSecurityAnswer(
        accountId: account.id,
        securityQuestionId: securityQuestion!.id,
        answer: securityAnswer,
      );

      return true;
    } catch (_) {
      _setError('Unable to create account');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  void clearAll() {
    _selectedQuestion = null;
    _clearError();
    _isLoading = false;
    notifyListeners();
  }

  bool _setError(String message) {
    _errorMessage = message;
    notifyListeners();
    return false;
  }

  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> _checkDuplicateMobile(String mobileNumber) async {
    final existing = await _accountRepository.getAccountByMobile(mobileNumber);
    return existing == null;
  }

  Future<dynamic> _createAccount({
    required String associationName,
    required String mobileNumber,
    required String pin,
  }) async {
    return await _accountRepository.register(
      associationName: associationName,
      mobileNumber: mobileNumber,
      pin: pin,
    );
  }

  Future<void> _saveSecurityAnswer({
    required int accountId,
    required int securityQuestionId,
    required String answer,
  }) async {
    await _accountRepository.saveSecurityAnswer(
      accountId: accountId,
      securityQuestionId: securityQuestionId,
      answer: answer,
    );
  }
}
