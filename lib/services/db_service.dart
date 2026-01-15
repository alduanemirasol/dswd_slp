import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBService {
  static final DBService _instance = DBService._internal();
  factory DBService() => _instance;
  DBService._internal();
  static Database? _database;

  // Get database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize database
  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'app_data.db');

    return await openDatabase(
      path,
      version: 1,
      onConfigure: _onConfigure,
      onCreate: _onCreate,
    );
  }

  // Configure database
  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON'); // enable foreign keys
  }

  // Create tables
  Future<void> _onCreate(Database db, int version) async {
    await _createLookupTables(db);
    await _seedLookupTables(db);
    await _createCoreTables(db);
    await _createRelationshipTables(db);
  }

  // Seed default lookup data
  Future<void> _seedLookupTables(Database db) async {
    // Product categories
    const productCategories = [
      {'id': 1, 'text': 'Imnonon'},
      {'id': 2, 'text': 'Alak'},
      {'id': 3, 'text': 'Pagkaon'},
      {'id': 4, 'text': 'Panglimpyo'},
      {'id': 5, 'text': 'Gamit sa Panimalay'},
      {'id': 6, 'text': 'Gamit sa Eskwelahan'},
      {'id': 7, 'text': 'Uban Pa'},
    ];
    for (var cat in productCategories) {
      await db.insert('product_categories', cat);
    }

    // Security questions
    const securityQuestions = [
      {'id': 1, 'text': 'What is your mother’s maiden name?'},
      {'id': 2, 'text': 'What was your first pet’s name?'},
      {'id': 3, 'text': 'What is your favorite color?'},
    ];
    for (var q in securityQuestions) {
      await db.insert('security_questions', q);
    }

    // Sale types
    const saleTypes = [
      {'id': 1, 'name': 'Cash'},
      {'id': 2, 'name': 'Credit'},
    ];
    for (var s in saleTypes) {
      await db.insert('sale_types', s);
    }
  }

  // Lookup tables
  Future<void> _createLookupTables(Database db) async {
    await db.execute('''
      CREATE TABLE security_questions (
        id INTEGER PRIMARY KEY,
        text TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE product_categories (
        id INTEGER PRIMARY KEY,
        text TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE sale_types (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL
      )
    ''');
  }

  // Core tables
  Future<void> _createCoreTables(Database db) async {
    // Accounts
    await db.execute('''
      CREATE TABLE accounts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        association_name TEXT NOT NULL,
        mobile_number TEXT NOT NULL,
        pin TEXT NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    // Customers
    await db.execute('''
      CREATE TABLE customers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        account_id INTEGER NOT NULL,
        name TEXT NOT NULL,
        mobile_number TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        FOREIGN KEY(account_id) REFERENCES accounts(id) ON DELETE CASCADE
      )
    ''');

    // Capital
    await db.execute('''
      CREATE TABLE capital (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        account_id INTEGER NOT NULL,
        amount REAL NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        FOREIGN KEY(account_id) REFERENCES accounts(id) ON DELETE CASCADE
      )
    ''');

    // Cash flows
    await db.execute('''
      CREATE TABLE cash_flows (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        account_id INTEGER NOT NULL,
        flow_type TEXT NOT NULL,
        category TEXT NOT NULL,
        reference_id INTEGER,
        amount REAL NOT NULL,
        flow_date TEXT NOT NULL,
        description TEXT,
        created_at TEXT NOT NULL,
        FOREIGN KEY(account_id) REFERENCES accounts(id) ON DELETE CASCADE
      )
    ''');
  }

  // Tables with foreign key relationships
  Future<void> _createRelationshipTables(Database db) async {
    // Account security answers
    await db.execute('''
      CREATE TABLE account_security_answers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        account_id INTEGER NOT NULL,
        security_question_id INTEGER NOT NULL,
        answer TEXT NOT NULL,
        created_at TEXT NOT NULL,
        FOREIGN KEY(account_id) REFERENCES accounts(id) ON DELETE CASCADE,
        FOREIGN KEY(security_question_id) REFERENCES security_questions(id)
      )
    ''');

    // Products
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        account_id INTEGER NOT NULL,
        product_category_id INTEGER NOT NULL,
        name TEXT NOT NULL,
        purchase_price REAL NOT NULL,
        selling_price REAL NOT NULL,
        image_path TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        FOREIGN KEY(account_id) REFERENCES accounts(id) ON DELETE CASCADE,
        FOREIGN KEY(product_category_id) REFERENCES product_categories(id)
      )
    ''');

    // Product inventory
    await db.execute('''
      CREATE TABLE product_inventory (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        product_id INTEGER NOT NULL,
        quantity INTEGER NOT NULL,
        updated_at TEXT NOT NULL,
        FOREIGN KEY(product_id) REFERENCES products(id) ON DELETE CASCADE
      )
    ''');

    // Sales
    await db.execute('''
      CREATE TABLE sales (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        account_id INTEGER NOT NULL,
        customer_id INTEGER,
        sale_type_id INTEGER NOT NULL,
        sale_date TEXT NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        FOREIGN KEY(account_id) REFERENCES accounts(id),
        FOREIGN KEY(customer_id) REFERENCES customers(id),
        FOREIGN KEY(sale_type_id) REFERENCES sale_types(id)
      )
    ''');

    // Sale items
    await db.execute('''
      CREATE TABLE sale_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sale_id INTEGER NOT NULL,
        product_id INTEGER NOT NULL,
        quantity INTEGER NOT NULL,
        unit_price REAL NOT NULL,
        FOREIGN KEY(sale_id) REFERENCES sales(id) ON DELETE CASCADE,
        FOREIGN KEY(product_id) REFERENCES products(id)
      )
    ''');

    // Debts
    await db.execute('''
      CREATE TABLE debts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sale_id INTEGER NOT NULL,
        total_due REAL NOT NULL,
        credit_date TEXT NOT NULL,
        due_date TEXT NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        FOREIGN KEY(sale_id) REFERENCES sales(id) ON DELETE CASCADE
      )
    ''');

    // Debt payments
    await db.execute('''
      CREATE TABLE debt_payments (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        debt_id INTEGER NOT NULL,
        amount REAL NOT NULL,
        payment_date TEXT NOT NULL,
        FOREIGN KEY(debt_id) REFERENCES debts(id) ON DELETE CASCADE
      )
    ''');
  }
}
