import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:veterinaria_ml_movil/presentacion/providers/ventaProvider.dart';
import 'package:veterinaria_ml_movil/Core/constants/sesionToken.dart';

import 'widget/tarjetas.dart';
import 'widget/buscador.dart';
import 'widget/filtro.dart';

import 'widget/temporal/ventas_chart.dart';
import 'widget/temporal/tendencia_agosto.dart';

class VentasScreen extends StatefulWidget {
  const VentasScreen({super.key});

  @override
  State<VentasScreen> createState() => _VentasScreenState();
}

class _VentasScreenState extends State<VentasScreen> {
  int vistaSeleccionada = 0;
  int filtroSeleccionado = 0;
  String busqueda = '';

  @override
  void initState() {
    super.initState();

    // AGREGADO: cargar las ventas al abrir la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final token = TokenSesion.token;

      if (mounted && token != null && token.isNotEmpty) {
        context.read<VentaProvider>().cargarVentas(token);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<VentaProvider>();

    // AGREGADO: buscar y filtrar las ventas
    final ventas = provider.ventas.where((venta) {
      final coincideBusqueda =
          'V-${venta.idVenta}'.toLowerCase().contains(busqueda.toLowerCase());

      final fecha = venta.fechaVenta;
      final ahora = DateTime.now();

      final hoy = DateTime(ahora.year, ahora.month, ahora.day);
      final ayer = hoy.subtract(const Duration(days: 1));
      final fechaVenta = DateTime(fecha.year, fecha.month, fecha.day);

      bool coincideFecha;

      switch (filtroSeleccionado) {
        case 0:
          coincideFecha = fechaVenta == hoy;
          break;
        case 1:
          coincideFecha = fechaVenta == ayer;
          break;
        case 2:
          coincideFecha = !fechaVenta.isBefore(
                hoy.subtract(const Duration(days: 6)),
              ) &&
              !fechaVenta.isAfter(hoy);
          break;
        case 3:
          coincideFecha =
              fecha.year == ahora.year && fecha.month == ahora.month;
          break;
        default:
          coincideFecha = true;
      }

      return coincideBusqueda && coincideFecha;
    }).toList();

    return Scaffold(
      body: Column(
        children: [
          // Encabezado original
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
            child: const Text(
              'Ventas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 14),

          // Cambiar entre Reporte e Historial
          SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: 0, label: Text('Reporte')),
              ButtonSegment(value: 1, label: Text('Historial')),
            ],
            selected: {vistaSeleccionada},
            onSelectionChanged: (seleccion) {
              setState(() {
                vistaSeleccionada = seleccion.first;
              });
            },
          ),

          const SizedBox(height: 8),

          // Contenido de cada pestaña
          Expanded(
            child: vistaSeleccionada == 0
                ? ListView(
                    padding: const EdgeInsets.all(12),
                    children: const [
                      VentasChar(),
                      SizedBox(height: 8),
                      TendenciaAgosto(),
                    ],
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: BuscadorVenta(
                          onBuscar: (texto) {
                            setState(() => busqueda = texto);
                          },
                        ),
                      ),

                      const SizedBox(height: 8),

                      Filtro(
                        seleccionado: filtroSeleccionado,
                        onCambiar: (valor) {
                          setState(() => filtroSeleccionado = valor);
                        },
                      ),

                      const SizedBox(height: 8),

                      Expanded(
                        child: provider.cargando
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : provider.error != null
                                ? Center(child: Text(provider.error!))
                                : RefreshIndicator(
                                    onRefresh: () async {
                                      final token = TokenSesion.token;
                                      if (token != null && token.isNotEmpty) {
                                        await provider.cargarVentas(token);
                                      }
                                    },
                                    child: ventas.isEmpty
                                        ? ListView(
                                            children: const [
                                              SizedBox(height: 100),
                                              Center(
                                                child: Text(
                                                  'No hay ventas para mostrar',
                                                ),
                                              ),
                                            ],
                                          )
                                        : ListView.builder(
                                            padding: const EdgeInsets.all(12),
                                            itemCount: ventas.length,
                                            itemBuilder: (context, index) {
                                              return Tarjetaventa(
                                                venta: ventas[index],
                                              );
                                            },
                                          ),
                                  ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}