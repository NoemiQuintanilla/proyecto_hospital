import 'package:flutter/material.dart';
import 'package:flutter_hospital/views/agregarMedicamento.dart';
import 'package:flutter_hospital/views/rutaAntibioticos.dart';
import 'package:flutter_hospital/views/vistaCategorias.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicacion de hospital',
      initialRoute: "/ ",
      routes: {
        "/": (context) => VistaCategorias(),
        "/rutaAntibioticos": (context) => RutaAntibioticos(),
        "/rutaAgregarMedicamento": (context) => RutaAgregarMedicamento(),
      },
    );
  }
}
