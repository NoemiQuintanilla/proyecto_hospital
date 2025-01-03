import 'package:flutter/material.dart';
import 'package:flutter_hospital/models/categoria.dart';
import 'package:flutter_hospital/repositorios/categoria_repository.dart';

class VistaCategorias extends StatefulWidget {
  const VistaCategorias({super.key});

  @override
  State<VistaCategorias> createState() => _VistaCategoriasState();
}

class _VistaCategoriasState extends State<VistaCategorias> {
  final CategoriaRepository _categoriaRepository = CategoriaRepository();
  List<Categoria> _categorias = [];
  List<Categoria> _categoriasFiltradas = [];
  String _busqueda = "";

  @override
  void initState() {
    super.initState();
    _cargarCategorias();
  }

  Future<void> _cargarCategorias() async {
    try {
      final categorias = await _categoriaRepository.list();
      setState(() {
        _categorias = categorias;
        _categoriasFiltradas = categorias;
      });
    } catch (e) {
      // Manejar errores si es necesario
      print("Error al cargar categorías: $e");
    }
  }

  void _filtrarCategorias(String texto) {
    setState(() {
      _busqueda = texto;
      _categoriasFiltradas = _categorias
          .where((categoria) =>
              categoria.nombre.toLowerCase().contains(texto.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorías Medicamentos"),
        centerTitle: true,
        backgroundColor: const Color(0xFF254754),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Buscador (TextField)
            TextField(
              decoration: InputDecoration(
                labelText: 'Buscar categoría',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF49b6c7)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF49b6c7)),
                ),
              ),
              onChanged: _filtrarCategorias,
            ),
            const SizedBox(height: 16),
            // Lista de categorías
            Expanded(
              child: ListView.builder(
                itemCount: _categoriasFiltradas.length,
                itemBuilder: (context, index) {
                  final categoria = _categoriasFiltradas[index];
                  return _buildListCard(
                    context,
                    categoria.imagen, // Reemplaza con la ruta correcta
                    categoria.nombre,
                    categoria.descripcion,
                    categoria.id!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/rutaAgregar')
              .then((_) => _cargarCategorias());
        },
        backgroundColor: const Color(0xFF254754),
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
    );
  }

  Widget _buildListCard(BuildContext context, String? imagePath, String title,
      String subtitle, int id) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color.fromARGB(255, 208, 249, 255),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: imagePath != null && imagePath.isNotEmpty
              ? Image.network(
                  imagePath, // Usar la URL o ruta de la imagen
                  fit: BoxFit.cover,
                  width: 48,
                  height: 48,
                )
              : const Icon(
                  Icons.image, // Icono predeterminado si no hay imagen
                  size: 48,
                  color: Colors.grey,
                ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit,
                  color: Color.fromARGB(255, 251, 255, 35)),
              onPressed: () {
                Navigator.pushNamed(context, '/rutaEditar', arguments: id)
                    .then((_) => _cargarCategorias());
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirmar eliminación'),
                      content: const Text(
                          '¿Estás seguro de que quieres eliminar esta categoría?'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Eliminar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
