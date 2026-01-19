class ProductCategory {
  final int id;
  final String text;

  const ProductCategory({required this.id, required this.text});
  Map<String, dynamic> toMap() => {'id': id, 'text': text};
}

const List<ProductCategory> productCategories = [
  ProductCategory(id: 1, text: 'Imnonon'),
  ProductCategory(id: 2, text: 'Alak'),
  ProductCategory(id: 3, text: 'Pagkaon'),
  ProductCategory(id: 4, text: 'Panglimpyo'),
  ProductCategory(id: 5, text: 'Gamit sa Panimalay'),
  ProductCategory(id: 6, text: 'Gamit sa Eskwelahan'),
  ProductCategory(id: 7, text: 'Uban Pa'),
];
