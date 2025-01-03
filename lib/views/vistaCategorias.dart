import 'package:flutter/material.dart';
import 'package:flutter_hospital/database_helper.dart';
import 'package:flutter_hospital/vistaMedicinas.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final data = await dbHelper.getCategories();
    setState(() {
      _categories = data;
      isLoading = false;
    });
  }

  Future<void> _deleteCategory(int categoryId) async {
    await dbHelper.deleteCategory(categoryId);
    _loadCategories();
  }

  void _editCategory(int categoryId) {
    // Navegar a una pantalla de edición (implementarla según sea necesario)
    print("Editar categoría ID: $categoryId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categorías Medicamentos",
          textAlign: TextAlign.center,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF142e38),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(241, 244, 249, 0.5),
          border: Border(
            top: BorderSide(
              color: Color.fromRGBO(30, 31, 32, 0.5),
            ),
          ),
        ),
        child: Column(
          children: [
            // Filtro de búsqueda
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                    width: 300,
                    child: TextField(
                      textCapitalization: TextCapitalization.words,
                      autocorrect: true,
                      cursorColor: const Color.fromARGB(255, 105, 103, 103),
                      decoration: const InputDecoration(
                        fillColor: Color.fromRGBO(216, 242, 245, 1),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Buscar categoría ...',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(87, 99, 108, 0.5),
                          fontSize: 14,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Material(
                      color: const Color.fromRGBO(37, 71, 84, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: IconButton(
                          icon: const Icon(Icons.search_sharp, size: 24, color: Colors.white),
                          onPressed: () {
                            // Acción para buscar categorías
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Lista de Categorías
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _categories.isEmpty
                      ? const Center(child: Text('No hay categorías disponibles'))
                      : ListView.builder(
                          itemCount: _categories.length,
                          itemBuilder: (context, index) {
                            final category = _categories[index];
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Card(
                                elevation: 4,
                                color: const Color.fromRGBO(216, 242, 245, 1),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MedicineList(categoryId: category['id']),
                                      ),
                                    );
                                  },
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: category['imageUrl'] != null
                                        ? Image.asset(
                                            'assets/images/${category['imageUrl']}',
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          )
                                        : const Icon(
                                            Icons.image_not_supported,
                                            size: 50,
                                            color: Color.fromARGB(255, 236, 236, 236),
                                          ),
                                  ),
                                  title: Text(
                                    category['name'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  trailing: SizedBox(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit, color: Colors.amber, size: 30),
                                          onPressed: () => _editCategory(category['id']),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete, color: Colors.red, size: 30),
                                          onPressed: () => _deleteCategory(category['id']),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción para agregar nueva categoría
        },
        backgroundColor: const Color.fromRGBO(37, 71, 84, 1),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
