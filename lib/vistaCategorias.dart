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
            // Buscador (TextField)
            TextField(
              decoration: InputDecoration(
                labelText: 'Buscar categoría',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF49b6c7)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF49b6c7)),
                ),
              ),
              onChanged: (text) {
                // Aquí agregarías la lógica para filtrar las tarjetas
                // con base en el texto ingresado en el buscador
              },
            ),
            const SizedBox(height: 16), // Espacio entre el buscador y la lista
            Expanded(
              child: ListView(
                children: [
                  _buildListCard(
                      context,
                      'assets/images/imagen1.png',
                      'Antibióticos',
                      'Administra antibióticos',
                      '/rutaAntibioticos'),
                  _buildListCard(
                      context,
                      'assets/images/imagen2.png',
                      'Analgésicos',
                      'Administra analgésicos',
                      '/rutaAnalgesicos'),
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
                ],
              ),
            ),
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
      color: const Color.fromARGB(
          255, 208, 249, 255), // Color de fondo de la tarjeta
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
        trailing: Row(
          mainAxisSize: MainAxisSize.min, // Ajusta el ancho al contenido
          children: [
            IconButton(
              icon: const Icon(Icons.edit,
                  color: Color.fromARGB(255, 251, 255, 35)),
              onPressed: () {
                // Acción de editar
                Navigator.pushNamed(context,
                    '/rutaEditar'); // Cambia la ruta según sea necesario
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Acción de eliminar
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirmar eliminación'),
                      content: const Text(
                          '¿Estás seguro de que quieres eliminar esta categoría?'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Eliminar'),
                          onPressed: () {
                            // Lógica de eliminación
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
