import 'package:flutter/material.dart';

class AgregarCategoria extends StatelessWidget {
  AgregarCategoria({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  TextStyle estiloTextoFoto() {
    return const TextStyle(
      fontSize: 14,
      color: Color(0xFF616161),
      fontWeight: FontWeight.bold, // Opcional: darle más peso al texto
    );
  }

  BoxDecoration estiloContenedorFoto() {
    return BoxDecoration(
      color: const Color(0xFFF3E5F5),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.shade300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Categoría"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
        backgroundColor: const Color(0xFF254754),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: estilosCampoTexto('Nombre de la Categoría'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
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
              Text(
                "Foto",
                style: estiloTextoFoto(),
              ),
              const SizedBox(height: 8),
              Container(
                height: 150,
                width: double.infinity,
                decoration: estiloContenedorFoto(),
                child: const Center(
                  child: Text(
                    "Subir Imagen",
                    style: TextStyle(color: Color(0xFF9E9E9E)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Estado",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF616161),
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) {
                      // Acción cuando se cambia el estado
                    },
                    activeColor: Colors.purple,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Guardar datos del formulario
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Datos guardados correctamente"),
                            ),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.save, color: Colors.white, size: 20),
                          SizedBox(width: 8),
                          Text(
                            "Guardar",
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
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 140,
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
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
