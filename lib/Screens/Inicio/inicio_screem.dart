import 'package:flutter/material.dart';

import 'widget/dashboard_header.dart';
import 'widget/estadistica_cart.dart';
import 'widget/tendencia_agosto.dart';
import 'widget/ventas_chart.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
//int _indiceSeleccionado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 247, 245),
      body: SafeArea(
        bottom: false,
        child: IndexedStack(
    //    index: _indiceSeleccionado == 0 ? 0 : 1,
          children: [
            _buildDashboard(context),
           
          ],
        ),
      ),
      
    );
  }

  Widget _buildDashboard(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: DashboardHeader(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: EstadisticaCart(
                        titulo: 'Ventas del mes',
                        valor: r'c$89,450',
                        porcentaje: '+14',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: EstadisticaCart(
                        titulo: 'Administradores',
                        valor: '2',
                        porcentaje: '+8%',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: EstadisticaCart(
                        titulo: 'Productos',
                        valor: '1,456',
                        porcentaje: '+12'
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: EstadisticaCart(
                        titulo: 'Stock Critico',
                        valor: '8',
                        porcentaje: 'Alerta',
                        alerta: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 0),
              const TendenciaAgosto(),
              const SizedBox(height: 20),
              const VentasChar(),
            ]),
          ),
        ),
      ],
    );
  }

  
}

