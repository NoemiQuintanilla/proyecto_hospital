import 'package:flutter/material.dart';

class VistaCategorias extends StatelessWidget {
  const VistaCategorias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorias Medicamentos"),
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
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2, // Número de columnas
          crossAxisSpacing: 10, // Espacio entre columnas
          mainAxisSpacing: 10, // Espacio entre filas
          children: [
            _buildCard(context, 'assets/images/imagen1.png', 'Antibióticos',
                '/rutaAntibioticos'),
            _buildCard(context, 'assets/images/imagen2.png', 'Analgésicos',
                '/rutaAnalgesicos'),
            _buildCard(context, 'assets/images/imagen3.png',
                'Antiinflamatorios', '/rutaAntiinflamatorios'),
            _buildCard(context, 'assets/images/imagen4.png', 'Antidepresivos',
                '/rutaAntidepresivos'),
            _buildCard(context, 'assets/images/imagen5.png', 'Antialérgicos',
                '/rutaAntialergicos'),
            _buildCard(context, 'assets/images/imagen6.png', 'Antipiréticos',
                '/rutaAntipireticos'),
            _buildCard(context, 'assets/images/imagen1.png', 'Antialérgicos',
                '/rutaAntialergicos'),
            _buildCard(context, 'assets/images/imagen2.png', 'Antipiréticos',
                '/rutaAntipireticos'),
          ],
        ),
      ),
    );
  }

  // Función para crear una tarjeta que navega a una ruta específica
  Widget _buildCard(
      BuildContext context, String imagePath, String title, String routeName) {
    return Card(
      elevation: 4, // Sombra de la tarjeta
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Bordes redondeados
      ),
      color: const Color(0xFF49b6c7), // Color de fondo de la tarjeta
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName); // Navegación a otra ruta
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // Ajusta la imagen al espacio
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
