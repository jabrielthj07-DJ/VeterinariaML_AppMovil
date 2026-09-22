import 'package:flutter/material.dart';

// Widgets
import './widget/tarjetas.dart';


class InventarioScreen extends StatelessWidget {
  const InventarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
        title: const Text('Demo 1 Inventario'),
      ),

      body: Column(
      children: [
        // buscador
        // filtros
        const TarjetaProduct(),
        // etc.
      ],
      )
    );
    
  }
}