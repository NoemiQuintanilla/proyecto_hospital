import 'package:flutter_hospital/models/categoria.dart';
import 'package:flutter_hospital/settings/db_connection.dart';

class CategoriaRepository {
  final String tableName =
      "categoria"; // Nombre de la tabla en la base de datos

  // Crear una nueva categoría
  Future<int> create(Categoria categoria) async {
    final db = await DbConnection.getDatabase();
    return await db.insert('categoria', categoria.toMap());
  }

  // Listar todas las categorías
  Future<List<Categoria>> list() async {
    final db = await DbConnection.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('categoria');

    return List.generate(maps.length, (i) {
      return Categoria.fromMap(maps[i]);
    });
  }

  // Actualizar una categoría existente
  Future<int> update(Categoria categoria) async {
    return await DbConnection.update(
      tableName,
      categoria.toMap(),
      categoria.id!, // La función update espera el ID como parámetro directo
    );
  }
}
