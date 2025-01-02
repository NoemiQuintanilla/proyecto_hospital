import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'hospital.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(''' 
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY,
        name TEXT,
        imageUrl TEXT
      )
    ''');
    await db.execute(''' 
      CREATE TABLE medicines (
        id INTEGER PRIMARY KEY,
        name TEXT,
        categoryId INTEGER,
        FOREIGN KEY (categoryId) REFERENCES categories (id)
      )
    ''');
    await insertInitialData();
  }

  Future<void> insertInitialData() async {
    Database db = await database;
    // Insert categories with image URLs (ensure the images are in the correct folder)
    await db.insert('categories', {
      'id': 1,
      'name': 'Antibiotics',
      'imageUrl': 'assets/images/imagen1.png',  // Ensure image path is correct
    });
    await db.insert('medicines', {
      'id': 1,
      'name': 'Amoxicillin',
      'categoryId': 1,
    });
  }

  Future<int> insertCategory(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('categories', row);
  }

  Future<int> insertMedicine(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('medicines', row);
  }

  Future<List<Map<String, dynamic>>> getMedicinesByCategory(int categoryId) async {
    Database db = await database;
    return await db.query(
      'medicines',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    Database db = await database;
    return await db.query('categories');
  }
}
