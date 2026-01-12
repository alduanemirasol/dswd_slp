import 'package:flutter/material.dart';
import '../models/security_question_model.dart';
import '../data/security_questions.dart';

class SecurityQuestionViewModel extends ChangeNotifier {
  List<SecurityQuestion> _questions = [];
  bool _isLoading = false;

  List<SecurityQuestion> get questions => _questions;
  bool get isLoading => _isLoading;

  void loadQuestions() {
    _isLoading = true;
    notifyListeners();

    _questions = securityQuestions;

    _isLoading = false;
    notifyListeners();
  }

  SecurityQuestion? getQuestionById(int id) {
    try {
      return _questions.firstWhere((q) => q.id == id);
    } catch (e) {
      return null;
    }
  }
}
