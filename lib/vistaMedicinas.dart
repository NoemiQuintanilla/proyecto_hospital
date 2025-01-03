import 'package:flutter/material.dart';
import 'package:flutter_hospital/agregarMedicamento.dart';
import 'package:flutter_hospital/database_helper.dart';

class MedicineList extends StatefulWidget {
  final int categoryId;

  MedicineList({required this.categoryId});

  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  List<Map<String, dynamic>> _medicines = []; // Lista de medicamentos
  bool isLoading = true; // Para mostrar el cargando mientras se obtienen los datos

  @override
  void initState() {
    super.initState();
    _cargarMedicinas(); // Cargar las medicinas al iniciar la pantalla
  }

  // Cargar medicinas desde la base de datos
  Future<void> _cargarMedicinas() async {
    final data = await DatabaseHelper().getMedicinesByCategory(widget.categoryId); // Obtener medicinas según la categoría
    setState(() {
      _medicines = data;
      isLoading = false; // Detener la carga cuando los datos estén listos
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LISTADO DE MEDICINAS",
          
          textAlign: TextAlign.center,
        ),
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
                  : _medicines.isEmpty // Si no hay medicinas
                      ? Center(child: Text("No hay medicinas disponibles"))
                      : ListView.builder(
                          itemCount: _medicines.length,
                          itemBuilder: (context, index) {
                            var medicine = _medicines[index];
                            return Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                height: 100,
                                child: Card(
                                  elevation: 3, // Añadir sombra a la tarjeta
                                  color: Color.fromRGBO(216, 242, 245, 1),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start, // Asegura que los elementos estén alineados arriba
                                    children: [
                                      ListTile(
                                        leading: Container(
                                          child: Icon(
                                            Icons.medical_services, 
                                            size: 50, 
                                            color: Colors.blue,
                                          ),
                                        ),
                                        title: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            medicine['name'],
                                            style: TextStyle(
                                              fontSize: 16, 
                                              fontWeight: FontWeight.w600
                                            ),
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
                                    ],
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
