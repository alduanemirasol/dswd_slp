class SaleType {
  final int id;
  final String name;

  const SaleType({required this.id, required this.name});
  Map<String, dynamic> toMap() => {'id': id, 'name': name};
}
