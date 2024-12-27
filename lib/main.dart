import 'package:flutter/material.dart';
import 'package:flutter_hospital/agregarMedicamento.dart';
import 'package:flutter_hospital/rutaAntibioticos.dart';
import 'package:flutter_hospital/vistaCategorias.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicacion',
      initialRoute: "/ ",
      routes: {
        "/": (context) => VistaCategorias(),
        "/rutaAntibioticos": (context) => RutaAntibioticos(),
        "/rutaAgregarMedicamento": (context) => RutaAgregarMedicamento(),
      },
    );
  }
}
