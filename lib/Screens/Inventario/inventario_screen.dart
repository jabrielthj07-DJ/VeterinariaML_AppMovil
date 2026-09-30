import 'package:flutter/material.dart';

// Widgets
import './widget/tarjetas.dart';
import './widget/buscador.dart';
import './widget/filtro.dart';


class InventarioScreen extends StatelessWidget {
  const InventarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar (
        backgroundColor: const Color.fromARGB(255, 24, 82, 107),
        foregroundColor: Colors.white,
        centerTitle: true, // Centra the TT
        title: const Text('Estado de Existencias',
        style: TextStyle(
        color: Colors.white,
        fontFamily: 'sans-serif',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        ),
      ),
    ),

      body: Column(
      children: [

        const SizedBox(height: 14),
        const BuscadorProducto(),
        const SizedBox(height: 13),
        const Filtro(),
        const SizedBox(height: 8),
        const TarjetaProduct(), //p1 prueba
        const SizedBox(height: 8),
        const TarjetaProduct(), //p2
        const SizedBox(height: 8),
        const TarjetaProduct(),//p3
        const SizedBox(height: 8),
        const TarjetaProduct(),//p4
        const SizedBox(height: 8,),
        const TarjetaProduct(),//p5

      ],
      )
    );
    
  }
}