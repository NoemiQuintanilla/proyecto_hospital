import 'package:sqflite/sqflite.dart'; // Importar conexión a SQLite
import 'package:path/path.dart'; // Importar gestor de rutas

class DbConnection {
  // Constantes y configuración de la base de datos
  static const int version = 1;
  static const String dbname = "hospital.db";

  // Inicialización de la base de datos
  static Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), dbname),
      version: version,
      onCreate: _onCreate,
    );
  }

  // Método de creación de tablas
  static Future<void> _onCreate(Database db, int version) async {
    // Creación de la tabla "categoria"
    await db.execute('''
      CREATE TABLE categoria (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        descripcion TEXT NOT NULL,
        imagen TEXT
      )
    ''');

    // Creación de la tabla "medicamentos"
    await db.execute('''
      CREATE TABLE medicamentos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        cantidad INTEGER NOT NULL,
        precio REAL NOT NULL,
        categoria_id INTEGER NOT NULL,
        FOREIGN KEY (categoria_id) REFERENCES categoria (id)
      )
    ''');

    // Inserción inicial de datos en la tabla "categoria"
    await db.execute('''
      INSERT INTO categoria (id, nombre, descripcion) VALUES
      (1, 'Analgésicos', 'Medicamentos para aliviar el dolor', 'assets/images/imagen1.png'),
      (2, 'Antibióticos', 'Medicamentos para tratar infecciones', 'assets/images/imagen2.png'),
      (3, 'Antihistamínicos', 'Medicamentos para alergias', 'assets/images/imagen3.png')
    ''');

    // Inserción inicial de datos en la tabla "medicamentos"
    await db.execute('''
      INSERT INTO medicamentos (id, nombre, cantidad, precio, categoria_id) VALUES
      (1, 'Paracetamol', 100, 0.50, 1),
      (2, 'Ibuprofeno', 50, 0.80, 1),
      (3, 'Amoxicilina', 30, 1.20, 2),
      (4, 'Loratadina', 40, 0.90, 3)
    ''');
  }

  // Métodos genéricos
  static Future<int> insert(String tableName, Map<String, dynamic> data) async {
    final db = await getDatabase();
    return await db.insert(
      tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> insertRaw(String sql) async {
    final db = await getDatabase();
    return await db.rawInsert(sql);
  }

  static Future<int> update(
      String tableName, Map<String, dynamic> data, int id) async {
    final db = await getDatabase();
    return await db.update(
      tableName,
      data,
      where: "id = ?",
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> updateRaw(String sql) async {
    final db = await getDatabase();
    return await db.rawUpdate(sql);
  }

  static Future<int> delete(String tableName, int id) async {
    final db = await getDatabase();
    return await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  static Future<int> deleteRaw(String sql) async {
    final db = await getDatabase();
    return await db.rawDelete(sql);
  }

  static Future<List<Map<String, dynamic>>> query(String tableName) async {
    final db = await getDatabase();
    return await db.query(tableName);
  }

  static Future<List<Map<String, dynamic>>> filterQuery(
      String tableName, String where, List<dynamic> whereArgs) async {
    final db = await getDatabase();
    return await db.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
  }

  static Future<List<Map<String, dynamic>>> rawQuery(String sql) async {
    final db = await getDatabase();
    return await db.rawQuery(sql);
  }

  // Métodos específicos para la tabla "categoria"
  static Future<int> insertCategoria(String nombre, String descripcion) async {
    return await insert('categoria', {
      'nombre': nombre,
      'descripcion': descripcion,
    });
  }

  static Future<List<Map<String, dynamic>>> listCategorias() async {
    return await query('categoria');
  }

  // Métodos específicos para la tabla "medicamentos"
  static Future<int> insertMedicamento(
      String nombre, int cantidad, double precio, int categoriaId) async {
    return await insert('medicamentos', {
      'nombre': nombre,
      'cantidad': cantidad,
      'precio': precio,
      'categoria_id': categoriaId,
    });
  }

  static Future<List<Map<String, dynamic>>> listMedicamentos() async {
    return await query('medicamentos');
  }
}
