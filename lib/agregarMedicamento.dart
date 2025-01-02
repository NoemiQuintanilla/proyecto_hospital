import 'package:flutter/material.dart';

class RutaAgregarMedicamento extends StatelessWidget {
  const RutaAgregarMedicamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Medicamentos"),
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
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nombre del Medicamento',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Dosis',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Lógica para agregar medicamento
              },
              child: const Text('Agregar'),
            ),
          ],
        ),
      ),
    );
  }
}
