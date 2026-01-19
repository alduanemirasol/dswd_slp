class ExpenseCategory {
  final int id;
  final String name;

  const ExpenseCategory({required this.id, required this.name});
  Map<String, dynamic> toMap() => {'id': id, 'name': name};
}

const List<ExpenseCategory> expenseCategories = [
  ExpenseCategory(id: 1, name: 'Pagkaon'),
  ExpenseCategory(id: 2, name: 'Tubig'),
  ExpenseCategory(id: 3, name: 'Kuryente'),
  ExpenseCategory(id: 4, name: 'Mga Bayronon'),
  ExpenseCategory(id: 5, name: 'Uban pa'),
];
