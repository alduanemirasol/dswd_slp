class SecurityQuestion {
  final int id;
  final String text;

  const SecurityQuestion({required this.id, required this.text});
  Map<String, dynamic> toMap() => {'id': id, 'text': text};
}
