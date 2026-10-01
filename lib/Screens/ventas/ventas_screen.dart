import 'package:flutter/material.dart';

// Widgets
import './widget/tarjetas.dart';
import './widget/buscador.dart';
import './widget/filtro.dart';

// Temporal mientras el dashboard
import './widget/temporal/ventas_chart.dart';
import'./widget/temporal/tendencia_agosto.dart';
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
  // appBar: AppBar (
  //     centerTitle: true, // Centra the title
  //       title: Text('Analisis de Ventas',
  //        style: Theme.of(context).textTheme.titleLarge,
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
        'Ventas',
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
        Column(
    children: const [
      VentasChar(),
      SizedBox(height: 8),
      TendenciaAgosto(),

     // Sol de prueba despues power bi
    ],
  )
        else

       Column(
    children: [
      const BuscadorVenta(),
      const SizedBox(height: 8),
      const Filtro(),
      const SizedBox(height: 8),
      const Tarjetaventa(),
      const SizedBox(height: 8),
      const Tarjetaventa(),
      const SizedBox(height: 8),
      const Tarjetaventa(),
      const SizedBox(height: 8),
      const Tarjetaventa(),
      const SizedBox(height: 8),
    ],
  ),
      ],
      )
    );
    
  }
}