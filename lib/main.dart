import 'package:flutter/material.dart';
import 'package:flutter_hospital/categorias/agregarCategoria.dart';
import 'package:flutter_hospital/categorias/agregarMedicamento.dart';
import 'package:flutter_hospital/categorias/editarCategoria.dart';
import 'package:flutter_hospital/categorias/vistaCategorias.dart';
import 'package:flutter_hospital/categorias/vistaMedicinas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/VistaCategorias',
      routes: {
        '/': (context) => VistaCategorias(),
        '/agregarCategoria': (context) => AgregarCategoria(),
        '/editarCategoria': (context) => EditCategoryScreen(),
        '/vistaMedicinas': (context) => MedicineList(
            categoryId: 1), // Asegúrate de pasar el categoryId correcto
        '/agregarMedicamento': (context) => MedicamentoNuevo(),
      },
    );
  }
}
