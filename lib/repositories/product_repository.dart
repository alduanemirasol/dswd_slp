import 'package:sqflite/sqflite.dart';

class ProductRepository {
  final Database db;
  ProductRepository(this.db);

  Future<List<String>> getCategories() async {
    final result = await db.query('product_categories');
    return result.map((row) => row['text'] as String).toList();
  }
}
