import 'package:flutter/foundation.dart';
import '../data/security_questions.dart';
import '../helpers/account_session_helper.dart';
import '../models/security_questions_model.dart';
import '../repositories/account_repository.dart';

class RegisterViewModel extends ChangeNotifier {
  final AccountRepository _accountRepository;
  RegisterViewModel(this._accountRepository);

  bool _isLoading = false;
  String? _errorMessage;

  List<SecurityQuestion> _questions = [];
  late SecurityQuestion _selectedQuestion;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<SecurityQuestion> get questions => _questions;
  SecurityQuestion get selectedQuestion => _selectedQuestion;

  // Load security questions and set a default
  void loadSecurityQuestions() {
    _questions = securityQuestions;
    if (_questions.isNotEmpty) _selectedQuestion = _questions.first;
    notifyListeners();
  }

  // User selects a question
  void selectQuestion(SecurityQuestion question) {
    _selectedQuestion = question;
    notifyListeners();
  }

  // Validate form fields
  bool validateFields({
    required String associationName,
    required String mobileNumber,
    required String pin,
    required String confirmPin,
    required String securityAnswer,
  }) {
    if (associationName.trim().isEmpty) {
      return _setError("Association Name is required");
    }
    if (mobileNumber.trim().isEmpty) {
      return _setError("Mobile Number is required");
    }
    if (pin.trim().isEmpty) return _setError("PIN is required");
    if (confirmPin.trim().isEmpty) return _setError("Confirm PIN is required");
    if (pin != confirmPin) return _setError("PIN and Confirm PIN do not match");
    if (securityAnswer.trim().isEmpty) {
      return _setError("Security Answer is required");
    }

    _clearError();
    return true;
  }

  // Register
  Future<bool> register({
    required String associationName,
    required String mobileNumber,
    required String pin,
    required String confirmPin,
    required String securityAnswer,
  }) async {
    _setLoading(true);
    _clearError();

    if (!validateFields(
      associationName: associationName,
      mobileNumber: mobileNumber,
      pin: pin,
      confirmPin: confirmPin,
      securityAnswer: securityAnswer,
    )) {
      _setLoading(false);
      return false;
    }

    try {
      final duplicateFree = await _checkDuplicateMobile(mobileNumber);
      if (!duplicateFree) return _setError('Mobile number already registered');

      final account = await _createAccount(
        associationName: associationName,
        mobileNumber: mobileNumber,
        pin: pin,
      );

      // Save account ID
      await AccountSession.setAccountId(account.id);

      await _saveSecurityAnswer(
        accountId: account.id,
        securityQuestionId: _selectedQuestion.id,
        answer: securityAnswer,
      );

      return true;
    } catch (_) {
      return _setError('Unable to create account');
    } finally {
      _setLoading(false);
    }
  }

  // Reset state
  void clearAll() {
    if (_questions.isNotEmpty) _selectedQuestion = _questions.first;
    _clearError();
    _isLoading = false;
    notifyListeners();
  }

  // Set error and notify listeners
  bool _setError(String message) {
    _errorMessage = message;
    notifyListeners();
    return false;
  }

  // Clear error
  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // Loading state
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Check if mobile number already exists
  Future<bool> _checkDuplicateMobile(String mobileNumber) async {
    final existing = await _accountRepository.getAccountByMobile(mobileNumber);
    return existing == null;
  }

  // Create account

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

  // Save security answer
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
