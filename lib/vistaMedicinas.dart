import 'package:flutter/material.dart';
import 'package:flutter_hospital/database_helper.dart';

class MedicineList extends StatelessWidget {
  final int categoryId;
  final dbHelper = DatabaseHelper();

  MedicineList({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Medicamentos",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF254754),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: dbHelper.getMedicinesByCategory(categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No medicines found'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: snapshot.data!.map((medicine) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color.fromARGB(255, 208, 249, 255),
                    child: ListTile(
                      leading: const Icon(
                        Icons.medication,
                        size: 40,
                        color: Color(0xFF254754),
                      ),
                      title: Text(
                        medicine['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text('Detalles del medicamento'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.yellow),
                            onPressed: () {
                              // Navegar a la pantalla de edición de medicamentos
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Mostrar cuadro de diálogo de confirmación
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la pantalla de agregar medicamentos
        },
        backgroundColor: const Color(0xFF254754),
        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ),
    );
  }
}
