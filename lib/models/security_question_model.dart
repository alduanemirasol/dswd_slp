class SecurityQuestion {
  final int id;
  final String text;

  const SecurityQuestion({required this.id, required this.text});

  // Convert DB row to model
  factory SecurityQuestion.fromMap(Map<String, dynamic> map) {
    return SecurityQuestion(id: map['id'], text: map['text']);
  }

  // Convert model to DB row
  Map<String, dynamic> toMap() {
    return {'id': id, 'text': text};
  }
}
