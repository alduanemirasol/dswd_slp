import 'package:sqflite/sqflite.dart';

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
    const securityQuestions = [
      {'id': 1, 'text': "Unsa imong unang negosyo?"},
      {'id': 2, 'text': "Kinsay imong unang silingan?"},
      {'id': 3, 'text': "Kinsay imong unang suod nga amigo/amiga?"},
      {'id': 4, 'text': "Asa ka pirmi mamalit?"},
      {'id': 5, 'text': "Unsa imong paboritong lugar?"},
      {'id': 6, 'text': "Unsa kanunay nimo dala sa biyahe?"},
    ];
    for (var question in securityQuestions) {
      await db.insert(
        'security_questions',
        question,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Seed product categories
  static Future<void> seedProductCategories(Database db) async {
    const categories = [
      {'id': 1, 'text': 'Imnonon'},
      {'id': 2, 'text': 'Alak'},
      {'id': 3, 'text': 'Pagkaon'},
      {'id': 4, 'text': 'Panglimpyo'},
      {'id': 5, 'text': 'Gamit sa Panimalay'},
      {'id': 6, 'text': 'Gamit sa Eskwelahan'},
      {'id': 7, 'text': 'Uban Pa'},
    ];
    for (var category in categories) {
      await db.insert(
        'product_categories',
        category,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Seed expense categories
  static Future<void> seedExpenseCategories(Database db) async {
    const categories = [
      {'id': 1, 'name': 'Pagkaon'},
      {'id': 2, 'name': 'Tubig'},
      {'id': 3, 'name': 'Kuryente'},
      {'id': 4, 'name': 'Mga Bayronon'},
      {'id': 5, 'name': 'Uban pa'},
    ];
    for (var category in categories) {
      await db.insert(
        'expenses_categories',
        category,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Seed sale types
  static Future<void> seedSaleTypes(Database db) async {
    const types = [
      {'id': 1, 'name': 'Cash'},
      {'id': 2, 'name': 'Credit'},
    ];
    for (var type in types) {
      await db.insert(
        'sale_types',
        type,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Seed flow types
  static Future<void> seedFlowTypes(Database db) async {
    const types = [
      {'id': 1, 'name': 'income'},
      {'id': 2, 'name': 'expense'},
    ];
    for (final type in types) {
      await db.insert(
        'flow_types',
        type,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}
