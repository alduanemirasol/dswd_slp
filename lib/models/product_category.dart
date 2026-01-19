class ProductCategory {
  final int id;
  final String text;

  const ProductCategory({required this.id, required this.text});
  Map<String, dynamic> toMap() => {'id': id, 'text': text};
}
