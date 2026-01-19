class ExpenseCategory {
  final int id;
  final String name;

  const ExpenseCategory({required this.id, required this.name});
  Map<String, dynamic> toMap() => {'id': id, 'name': name};
}
