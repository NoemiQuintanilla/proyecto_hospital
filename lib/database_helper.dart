import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  // Esta es la instancia de la base de datos
  Future<Database> get database async {
    if (_database != null) return _database!; // Si ya existe, devuelve la base de datos
    _database = await _initDatabase(); // Si no, inicializa la base de datos
    return _database!;
  }

  // Inicializa la base de datos
  Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath(); // Obtiene la ruta de la base de datos
    String path = join(databasesPath, 'hospital.db'); // Ruta completa
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate, // Si no existe, se crea la base de datos
    );
  }

  // Crea las tablas en la base de datos
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
        description TEXT,
        quantity INTEGER,
        FOREIGN KEY (categoryId) REFERENCES categories (id)
      )
    ''');

    await insertInitialData(); // Inserta datos iniciales
  }

  // Inserta los datos iniciales
  Future<void> insertInitialData() async {
    Database db = await database;

    // Inserta categorías
    await db.insert('categories', {
      'id': 1,
      'name': 'Antibiotics',
      'imageUrl': 'imagen1.png',
    });

    await db.insert('categories', {
      'id': 2,
      'name': 'Pain Relievers',
      'imageUrl': 'imagen2.png',
    });

    // Inserta medicamentos
    await db.insert('medicines', {
      'id': 1,
      'name': 'Amoxicillin',
      'categoryId': 1,
      'description': 'Antibiotic used to treat infections',
      'quantity': 50,
    });

    await db.insert('medicines', {
      'id': 2,
      'name': 'Ibuprofen',
      'categoryId': 2,
      'description': 'Pain reliever and anti-inflammatory',
      'quantity': 30,
    });
  }

  // Obtener todas las categorías
  Future<List<Map<String, dynamic>>> getCategories() async {
    Database db = await database;
    return await db.query('categories');
  }

  // Obtener medicamentos por categoría
  Future<List<Map<String, dynamic>>> getMedicinesByCategory(int categoryId) async {
    Database db = await database;
    return await db.query(
      'medicines',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
  }

  deleteCategory(int categoryId) {}
}
