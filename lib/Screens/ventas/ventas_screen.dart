import 'package:flutter/material.dart';

// Widgets
import './widget/tarjetas.dart';
import './widget/buscador.dart';
import './widget/filtro.dart';

class VentasScreen extends StatefulWidget {
  const VentasScreen({super.key});

   @override
  State<VentasScreen> createState() => _VentasScreenState();
}

class _VentasScreenState extends State<VentasScreen> {

  int vistaSeleccionada = 0; // Acordarse q colas y hay dos btn here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar (
      backgroundColor: const Color(0xFF087A4B),
      foregroundColor: Colors.white,
        title: const Text('                     Analisis de Ventas',
        style: TextStyle(
        color: Color.fromARGB(255, 247, 250, 252),
        fontFamily: 'sans-serif',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        ),
      ),
    ),

      body: Column(
      children: [

        const SizedBox(height: 14),
            
      SegmentedButton<int>(
      segments: const [
        ButtonSegment(
          value: 0,
          label: Text('Reporte'),
        ),
        ButtonSegment(
          value: 1,
          label: Text('Historial'),
        ),
      ],
      selected: {vistaSeleccionada},
      onSelectionChanged: (Set<int> seleccion) {
        setState(() {
          vistaSeleccionada = seleccion.first;
        });
      },
    ),

        const SizedBox(height: 8),
       
        if (vistaSeleccionada == 0)
        const Text('Dashboard prueba') // Aqui recordar agregar power bi Reporte, acordarse que esta en trelo dise;o de figma
        else
        const BuscadorVenta(),

      
    

        const SizedBox(height: 8),
        const Filtro(),
        const SizedBox(height: 8),
        const Tarjetaventa(), //p1 prueba
        const SizedBox(height: 8),
        const Tarjetaventa(), //p2
        const SizedBox(height: 8),
        const Tarjetaventa(),//p3
        const SizedBox(height: 8),
        const Tarjetaventa(),//p4
        const SizedBox(height: 8,),
        const Tarjetaventa(),//p5

      ],
      )
    );
    
  }
}