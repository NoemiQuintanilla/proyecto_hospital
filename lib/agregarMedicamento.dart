import 'dart:io';
import 'package:flutter/material.dart';

class MedicamentoNuevo extends StatefulWidget {
  const MedicamentoNuevo({super.key});

  @override
  State<MedicamentoNuevo> createState() => _MedicamentoNuevoState();
}

class _MedicamentoNuevoState extends State<MedicamentoNuevo> {
  final _nuevoMedicamento = GlobalKey<FormState>();
  final nombreMedController = TextEditingController();
  final descripcionMedController = TextEditingController();
  final dosisMedController = TextEditingController();
  final presentacionMedController = TextEditingController();
  final stockMedController = TextEditingController();
  bool estado = true;
  File? _imagen;
  String? base64Imagen;

  InputDecoration estilosCampoTexto(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Color.fromRGBO(87, 99, 108, 0.5)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(224, 227, 231, 1),
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(224, 227, 231, 1),
          width: 2,
        ),
      ),
      floatingLabelStyle: TextStyle(color: Color.fromRGBO(87, 99, 108, 1)),
    );
  }

  void _guardarMedicamento() {
    if (_nuevoMedicamento.currentState!.validate()) {
      final medicamento = {
        'nombre': nombreMedController.text,
        'descripcion': descripcionMedController.text,
        'dosis': dosisMedController.text,
        'presentacion': presentacionMedController.text,
        'stock': int.tryParse(stockMedController.text),
        'estado': estado,
        'imagen': base64Imagen,
      };

      // Aquí puedes guardar el medicamento en la base de datos
      print('Medicamento guardado: $medicamento');

      // Limpiar los campos
      nombreMedController.clear();
      descripcionMedController.clear();
      dosisMedController.clear();
      presentacionMedController.clear();
      stockMedController.clear();
      setState(() {
        _imagen = null;
        base64Imagen = null;
        estado = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo Medicamento"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white, // Color del texto
          fontSize: 20, // Tamaño de la fuente
          fontWeight: FontWeight.bold, // Grosor de la fuente
          fontFamily: 'Roboto', // Familia de la fuente
        ),
        backgroundColor: const Color(0xFF254754),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _nuevoMedicamento,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nombreMedController,
                  decoration: estilosCampoTexto('Nombre del Medicamento'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El nombre es obligatorio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: descripcionMedController,
                  decoration: estilosCampoTexto('Descripción'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'La descripción es obligatoria';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: dosisMedController,
                  decoration: estilosCampoTexto('Dosis'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'La dosis es obligatoria';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: presentacionMedController,
                  decoration: estilosCampoTexto('Presentación'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'La presentación es obligatoria';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: stockMedController,
                  decoration: estilosCampoTexto('Cantidad en Stock'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'La cantidad en stock es obligatoria';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Debe ser un número';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Estado'),
                    Switch(
                      value: estado,
                      onChanged: (value) => setState(() => estado = value),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 140, // Reduce el tamaño del botón Guardar
                      child: ElevatedButton(
                        onPressed: _guardarMedicamento,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.save, color: Colors.white, size: 20),
                            SizedBox(width: 8),
                            Text(
                              "Guardar ",
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
                          padding: const EdgeInsets.symmetric(vertical: 8), // Reduce el padding
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
                          padding: const EdgeInsets.symmetric(vertical: 8), // Reduce el padding
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
