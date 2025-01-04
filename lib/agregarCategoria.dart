import 'package:flutter/material.dart';

class AgregarCategoria extends StatelessWidget {
  const AgregarCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Categoría"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white, // Color del texto
          fontSize: 20, // Tamaño de la fuente
          fontWeight: FontWeight.bold, // Grosor de la fuente
          fontFamily: 'Roboto', // Familia de la fuente
        ),
        backgroundColor: const Color(0xFF254754),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Nombre de la Categoría",
                labelStyle: TextStyle(color: Color(0xFF9E9E9E)),
                filled: true,
                fillColor: Color.fromARGB(
                    255, 215, 243, 255), // Fondo similar al estilo
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Descripción",
                labelStyle: TextStyle(color: Color(0xFF9E9E9E)),
                filled: true,
                fillColor: Color.fromARGB(
                    255, 215, 243, 255), // Fondo similar al estilo
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Subir Imagen",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF616161),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 215, 243, 255),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Center(
                child: Text(
                  "Subir Imagen",
                  style: TextStyle(color: Color(0xFF9E9E9E)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFfe3435),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 32), // Tamaño del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Acción al cancelar
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16), // Espacio entre los botones
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2c9aab),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 32), // Tamaño del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // Acción al guardar la categoría
                  },
                  child: const Text(
                    "Guardar",
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
