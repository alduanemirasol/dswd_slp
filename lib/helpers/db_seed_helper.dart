import 'package:sqflite/sqflite.dart';
import '../data/security_questions.dart';
import '../data/product_category.dart';
import '../data/expense_category.dart';
import '../data/flow_type.dart';
import '../data/sale_type.dart';

class DBSeed {
  // Seed all lookup tables
  static Future<void> seedLookupTables(Database db) async {
    await seedSecurityQuestions(db);
    await seedProductCategories(db);
    await seedSaleTypes(db);
    await seedFlowTypes(db);
  }

  // Seed security questions
  static Future<void> seedSecurityQuestions(Database db) async {
    for (var question in securityQuestions) {
      await db.insert(
        'security_questions',
        question.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Seed product categories
  static Future<void> seedProductCategories(Database db) async {
    for (var category in productCategories) {
      await db.insert(
        'product_categories',
        category.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Seed expense categories
  static Future<void> seedExpenseCategories(Database db) async {
    for (var category in expenseCategories) {
      await db.insert(
        'expenses_categories',
        category.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Seed sale types
  static Future<void> seedSaleTypes(Database db) async {
    for (var type in saleTypes) {
      await db.insert(
        'sale_types',
        type.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Seed flow types
  static Future<void> seedFlowTypes(Database db) async {
    for (var type in flowTypes) {
      await db.insert(
        'flow_types',
        type.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}
