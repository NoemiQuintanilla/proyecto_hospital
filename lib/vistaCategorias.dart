import 'package:flutter/material.dart';

class VistaCategorias extends StatelessWidget {
  const VistaCategorias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorías Medicamentos"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color(0xFFFFFFFF), // Color del texto
          fontSize: 20, // Tamaño de la fuente
          fontWeight: FontWeight.bold, // Grosor de la fuente
          fontFamily: 'Roboto', // Familia de la fuente
        ),
        backgroundColor: const Color(0xFF254754),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildListCard(context, 'assets/images/imagen1.png', 'Antibióticos',
                'Administra antibióticos', '/rutaAntibioticos'),
            _buildListCard(context, 'assets/images/imagen2.png', 'Analgésicos',
                'Administra analgésicos', '/rutaAnalgesicos'),
            _buildListCard(
                context,
                'assets/images/imagen3.png',
                'Antiinflamatorios',
                'Administra antiinflamatorios',
                '/rutaAntiinflamatorios'),
            _buildListCard(
                context,
                'assets/images/imagen4.png',
                'Antidepresivos',
                'Administra antidepresivos',
                '/rutaAntidepresivos'),
            _buildListCard(
                context,
                'assets/images/imagen5.png',
                'Antialérgicos',
                'Administra antialérgicos',
                '/rutaAntialergicos'),
            _buildListCard(
                context,
                'assets/images/imagen6.png',
                'Antipiréticos',
                'Administra antipiréticos',
                '/rutaAntipireticos'),
            _buildListCard(
                context,
                'assets/images/imagen4.png',
                'Antidepresivos',
                'Administra antidepresivos',
                '/rutaAntidepresivos'),
            _buildListCard(
                context,
                'assets/images/imagen5.png',
                'Antialérgicos',
                'Administra antialérgicos',
                '/rutaAntialergicos'),
            _buildListCard(
                context,
                'assets/images/imagen6.png',
                'Antipiréticos',
                'Administra antipiréticos',
                '/rutaAntipireticos'),
          ],
        ),
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

  // Función para crear una tarjeta en formato de lista
  Widget _buildListCard(BuildContext context, String imagePath, String title,
      String subtitle, String routeName) {
    return Card(
      elevation: 4, // Sombra de la tarjeta
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Bordes redondeados
      ),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, routeName); // Navegación a otra ruta
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 48,
            height: 48,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 16,
        ),
      ),
    );
  }
}
