import 'package:flutter/material.dart';

class EditarMedicamento extends StatefulWidget {
  final Map<String, dynamic> medicamento; // Medicamento que se editará
  final Function(Map<String, dynamic>)
      actualizarMedicamento; // Callback para actualizar

  EditarMedicamento({
    required this.medicamento,
    required this.actualizarMedicamento,
  });

  @override
  _EditarMedicamentoState createState() => _EditarMedicamentoState();
}

class _EditarMedicamentoState extends State<EditarMedicamento> {
  late TextEditingController _nombreController;
  late TextEditingController _descripcionController;
  late TextEditingController _dosisController;
  late TextEditingController _presentacionController;
  late TextEditingController _cantidadController;

  @override
  void initState() {
    super.initState();
    // Inicializar controladores con valores actuales
    _nombreController = TextEditingController(text: widget.medicamento['name']);
    _descripcionController =
        TextEditingController(text: widget.medicamento['description']);
    _dosisController = TextEditingController(text: widget.medicamento['dosis']);
    _presentacionController =
        TextEditingController(text: widget.medicamento['presentacion']);
    _cantidadController =
        TextEditingController(text: widget.medicamento['quantity'].toString());
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _dosisController.dispose();
    _presentacionController.dispose();
    _cantidadController.dispose();
    super.dispose();
  }

  void _guardarCambios() {
    // Crear un mapa con los valores actualizados
    Map<String, dynamic> medicamentoActualizado = {
      'name': _nombreController.text,
      'description': _descripcionController.text,
      'dosis': _dosisController.text,
      'presentacion': _presentacionController.text,
      'quantity': int.tryParse(_cantidadController.text) ?? 0,
    };

    // Llamar al callback para actualizar en la lista principal
    widget.actualizarMedicamento(medicamentoActualizado);

    // Volver a la pantalla anterior
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Medicamento"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
        backgroundColor: const Color(0xFF254754),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descripcionController,
              decoration: InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dosisController,
              decoration: InputDecoration(
                labelText: 'Dosis',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _presentacionController,
              decoration: InputDecoration(
                labelText: 'Presentación',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _cantidadController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cantidad',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    onPressed: _guardarCambios,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.save, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          "Guardar Cambios",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(73, 182, 199, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8), // Reduce el padding
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 140, // Reduce el tamaño del botón Cancelar
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.cancel, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          "Cancelar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8), // Reduce el padding
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
