import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  final ImagePicker _escoger = ImagePicker();
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

  Future<void> _escogerImagen(ImageSource source) async {
    final XFile? escogerFile = await _escoger.pickImage(source: source);
    if (escogerFile != null) {
      setState(() {
        _imagen = File(escogerFile.path);
        base64Imagen = base64Encode(_imagen!.readAsBytesSync());
      });
    }
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
      appBar: AppBar(title: const Text('Nuevo Medicamento')),
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
                GestureDetector(
                  onTap: () => _escogerImagen(ImageSource.gallery),
                  child: _imagen == null
                      ? Container(
                          height: 150,
                          width: double.infinity,
                          color: Colors.grey[200],
                          child: const Center(
                            child: Text('Subir Imagen'),
                          ),
                        )
                      : Image.file(_imagen!),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _guardarMedicamento,
                  child: const Text('Guardar Medicamento'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
