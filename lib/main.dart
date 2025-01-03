import 'package:flutter/material.dart';
import 'package:flutter_hospital/agregarMedicamento.dart';
import 'package:flutter_hospital/vistaCategorias.dart';
import 'package:flutter_hospital/vistaMedicinas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => VistaCategorias(),
        '/vistaMedicinas': (context) => MedicineList(categoryId: 1), // Asegúrate de pasar el categoryId correcto
        '/agregarMedicamento': (context) => MedicamentoNuevo(),
      },
    );
  }
}
