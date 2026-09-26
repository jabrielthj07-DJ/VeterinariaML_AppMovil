import 'package:flutter/material.dart';

// Widgets
import './widget/tarjetas.dart';
import './widget/buscador.dart';
import './widget/filtro.dart';

class VentasScreen extends StatelessWidget {
  const VentasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar (
       
        title: const Text('                                Ventas',
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
        const BuscadorVenta(),
        const SizedBox(height: 10),
        const Filtro(),
        const SizedBox(height: 10),
        const Tarjetaventa(), //p1 prueba
        const SizedBox(height: 10),
        const Tarjetaventa(), //p2
        const SizedBox(height: 10),
        const Tarjetaventa(),//p3
        const SizedBox(height: 10),
        const Tarjetaventa(),//p4
        const SizedBox(height: 10,),
        const Tarjetaventa(),//p5

      ],
      )
    );
    
  }
}