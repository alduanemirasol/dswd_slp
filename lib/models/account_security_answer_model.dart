class AccountSecurityAnswer {
  final int? id;
  final int accountId;
  final int securityQuestionId;
  final String answerHash;
  final DateTime createdAt;

  const AccountSecurityAnswer({
    this.id,
    required this.accountId,
    required this.securityQuestionId,
    required this.answerHash,
    required this.createdAt,
  });

  // Convert DB to model
  factory AccountSecurityAnswer.fromMap(Map<String, dynamic> map) {
    return AccountSecurityAnswer(
      id: map['id'],
      accountId: map['account_id'],
      securityQuestionId: map['security_question_id'],
      answerHash: map['answer'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  // Convert model to DB
  Map<String, dynamic> toMap() {
    return {
      'account_id': accountId,
      'security_question_id': securityQuestionId,
      'answer': answerHash,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
