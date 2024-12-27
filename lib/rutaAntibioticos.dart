import 'package:flutter/material.dart';

class RutaAntibioticos extends StatelessWidget {
  const RutaAntibioticos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventario Medicamentos"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255), // Color del texto
          fontSize: 20, // Tamaño de la fuente
          fontWeight: FontWeight.bold, // Grosor de la fuente
          fontFamily: 'Roboto', // Familia de la fuente
        ),
        backgroundColor: const Color(0xFF254754),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción al presionar el botón
          Navigator.pushNamed(
              context, '/rutaAgregar'); // Cambia a tu ruta deseada
        },
        backgroundColor: const Color(0xFF254754), // Color del botón
        child: const Icon(Icons.add,
            color: Colors.white, size: 32), // Icono del botón
      ),
    );
  }
}
