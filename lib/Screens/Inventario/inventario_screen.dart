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
  // appBar: AppBar (
  //       centerTitle: true, // Centra the TT
  //       title: Text('Estado de Existencias',
  //         style: Theme.of(context).textTheme.titleLarge,
  //     ),
  //   ),

      body: Column(
      children: [
       Container(
  width: double.infinity,
  padding: const EdgeInsets.all(20),
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF174B5B),
        Color(0xFF7BD0F3),
      ],
    ),
  ),
  child: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Inventario',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
),

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