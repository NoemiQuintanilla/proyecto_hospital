import 'package:flutter/material.dart';

class EditCategoryScreen extends StatefulWidget {
  const EditCategoryScreen({
    super.key,
  });
  @override
  State<EditCategoryScreen> createState() => _CategoriaEditarState();
}

class _CategoriaEditarState extends State<EditCategoryScreen> {
  final _nuevaCategoria = GlobalKey<FormState>();
  final nombreMedController = TextEditingController();
  final descripcionMedController = TextEditingController();
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

  void _guardarCategoria() {
    if (_nuevaCategoria.currentState!.validate()) {
      final medicamento = {
        'nombre': nombreMedController.text,
        'descripcion': descripcionMedController.text,
      };

      // Aquí puedes guardar el medicamento en la base de datos
      print('Medicamento guardado: $medicamento');

      // Limpiar los campos
      nombreMedController.clear();
      descripcionMedController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Categoría'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255), // Color del texto
          fontSize: 20, // Tamaño de la fuente
          fontWeight: FontWeight.bold, // Grosor de la fuente
          fontFamily: 'Roboto', // Familia de la fuente
        ),
        backgroundColor: const Color(0xFF254754),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 16),
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
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140, // Reduce el tamaño del botón Guardar
                  child: ElevatedButton(
                    onPressed: _guardarCategoria,
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
            ),
          ],
        ),
      ),
    );
  }
}
