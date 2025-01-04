import 'package:flutter/material.dart';
import 'agregarMedicamento.dart'; // Para la pantalla de agregar medicamento

class MedicineList extends StatefulWidget {
  final int categoryId;

  MedicineList({required this.categoryId});

  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  List<Map<String, dynamic>> _medicines = []; // Lista de medicamentos de ejemplo
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _cargarMedicinas(); // Cargar las medicinas al iniciar a pantalla
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LISTADO DE MEDICINAS", textAlign: TextAlign.center),
        backgroundColor: const Color(0xFF142e38),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
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
                          icon: Icon(Icons.search_sharp, size: 24, color: Colors.white),
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
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                          icon: Icon(Icons.edit, color: Colors.amber, size: 30),
                                          onPressed: () {
                                            // Acción para editar
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete, color: Colors.red, size: 30),
                                          onPressed: () {
                                            // Acción para eliminar
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MedicamentoNuevo(),
            ),
          );
        },
        child: Icon(Icons.add), // Ícono de agregar
      ),
    );
  }
}
