import 'package:flutter/material.dart';
import 'agregarMedicamento.dart'; // Para la pantalla de agregar medicamento

class MedicineList extends StatefulWidget {
  final int categoryId;

  MedicineList({required this.categoryId});

  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  List<Map<String, dynamic>> _medicines =
      []; // Lista de medicamentos de ejemplo
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _cargarMedicinas(); // Cargar las medicinas al iniciar la pantalla
  }

  // Cargar medicinas estáticas (sin base de datos)
  void _cargarMedicinas() {
    setState(() {
      _medicines = [
        {
          'name': 'Paracetamol',
          'description': 'Analgesico y antipirético',
          'quantity': 30,
        },
        {
          'name': 'Ibuprofeno',
          'description': 'Anti inflamatorio y analgésico',
          'quantity': 50,
        },
        {
          'name': 'Amoxicilina',
          'description': 'Antibiótico',
          'quantity': 20,
        },
      ];
      isLoading = false;
    });
  }

  // Función para agregar un nuevo medicamento a la lista
  void _agregarMedicamento(Map<String, dynamic> nuevoMedicamento) {
    setState(() {
      _medicines.add(nuevoMedicamento);
    });
  }

  // Función para eliminar un medicamento
  void _eliminarMedicamento(int index) {
    setState(() {
      _medicines.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de Medicinas"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white, // Color del texto
          fontSize: 20, // Tamaño de la fuente
          fontWeight: FontWeight.bold, // Grosor de la fuente
          fontFamily: 'Roboto', // Familia de la fuente
        ),
        backgroundColor: const Color(0xFF254754),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(241, 244, 249, 0.5),
        ),
        child: Column(
          children: [
            // Filtro de búsqueda
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                    width: 300,
                    child: TextField(
                      textCapitalization: TextCapitalization.words,
                      autocorrect: true,
                      cursorColor: Color.fromARGB(255, 105, 103, 103),
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(216, 242, 245, 1),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Buscar medicina ...',
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
                    padding: EdgeInsets.only(left: 20),
                    child: Material(
                      color: Color.fromRGBO(37, 71, 84, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: IconButton(
                          icon: Icon(Icons.search_sharp,
                              size: 24, color: Colors.white),
                          onPressed: () {
                            // Acción para buscar medicinas (aún no implementada)
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Lista de Medicinas
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator()) // Cargando
                  : _medicines.isEmpty
                      ? Center(child: Text("No hay medicinas disponibles"))
                      : ListView.builder(
                          itemCount: _medicines.length,
                          itemBuilder: (context, index) {
                            var medicine = _medicines[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Card(
                                elevation: 3, // Añadir sombra a la tarjeta
                                color: Color.fromRGBO(216, 242, 245, 1),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.medical_services,
                                    size: 50,
                                    color: Colors.blue,
                                  ),
                                  title: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      medicine['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Descripción: ${medicine['description']}",
                                        style: TextStyle(
                                          color: Color.fromRGBO(87, 99, 108, 1),
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "Cantidad: ${medicine['quantity']}",
                                        style: TextStyle(
                                          color: Color.fromRGBO(87, 99, 108, 1),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: SizedBox(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit,
                                              color: Colors.amber, size: 30),
                                          onPressed: () {
                                            // Acción para editar
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete,
                                              color: Colors.red, size: 30),
                                          onPressed: () {
                                            // Confirmación antes de eliminar
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Confirmar eliminación'),
                                                  content: Text(
                                                      '¿Estás seguro de que deseas eliminar este medicamento?'),
                                                  actions: [
                                                    TextButton(
                                                      child: Text('Cancelar'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: Text('Eliminar'),
                                                      onPressed: () {
                                                        _eliminarMedicamento(
                                                            index);
                                                        Navigator.of(context)
                                                            .pop();
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
          // Acción al presionar el botón
          Navigator.pushNamed(
              context, '/agregarMedicamento'); // Cambia a tu ruta deseada
        },
        backgroundColor: const Color(0xFF254754), // Color del botón
        child: const Icon(Icons.add,
            color: Colors.white, size: 32), // Icono del botón
      ),
    );
  }
}
