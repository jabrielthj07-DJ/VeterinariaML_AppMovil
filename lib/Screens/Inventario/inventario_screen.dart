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
       
        title: const Text('                Inventario',
        style: TextStyle(
        color: const Color.fromARGB(155, 18, 52, 79),
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
        const SizedBox(height: 10),
        const TarjetaProduct(), //p1 prueba
        const SizedBox(height: 10),
        const TarjetaProduct(), //p2
        const SizedBox(height: 10),
        const TarjetaProduct(),//p3
        const SizedBox(height: 10),
        const TarjetaProduct(),//p4
      ],
      )
    );
    
  }
}