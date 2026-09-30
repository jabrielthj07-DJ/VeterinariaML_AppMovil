// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../Inicio/inicio_navegacion.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Veterinaria M&L'),
        backgroundColor: const Color.fromARGB(255, 134, 209, 247),
      ),
      body: const Center(
        child: Text(
          '¡Bienvenido al Inicio de la Veterinaria!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
