
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Core/constants/sesionToken.dart';
import '../../../presentacion/providers/ventaProvider.dart';
import 'widget/tarjetas.dart';
import 'widget/buscador.dart';
import 'widget/filtro.dart';

class VentasScreen extends StatefulWidget {
  const VentasScreen({super.key});

  @override
  State<VentasScreen> createState() => _VentasScreenState();
}

class _VentasScreenState extends State<VentasScreen> {
  String busqueda = '';
  int filtroSeleccionado = 0;

  final List<String> filtros = [
    'Todas',
    'Hoy',
    'Ayer',
    'Semanal',
    'Mensual',
  ];

  @override
  void initState() {
    super.initState();

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
    final todasLasVentas = provider.ventas;

    final ahora = DateTime.now();
    final hoy = DateTime(ahora.year, ahora.month, ahora.day);
    final ayer = hoy.subtract(const Duration(days: 1));

    final ventasFiltradas = todasLasVentas.where((venta) {
      final coincideBusqueda =
          'V-${venta.idVenta}'.toLowerCase().contains(
                busqueda.toLowerCase(),
              );

      final fecha = DateTime(
        venta.fechaVenta.year,
        venta.fechaVenta.month,
        venta.fechaVenta.day,
      );

      bool coincideFecha;

      switch (filtroSeleccionado) {
        case 1:
          coincideFecha = fecha == hoy;
          break;
        case 2:
          coincideFecha = fecha == ayer;
          break;
        case 3:
          coincideFecha =
              !fecha.isBefore(hoy.subtract(const Duration(days: 6))) &&
              !fecha.isAfter(hoy);
          break;
        case 4:
          coincideFecha =
              fecha.year == ahora.year && fecha.month == ahora.month;
          break;
        default:
          coincideFecha = true;
      }

      return coincideBusqueda && coincideFecha;
    }).toList();

    final totalVendido = todasLasVentas.fold<double>(
      0,
      (total, venta) => total + venta.total,
    );

    final cantidadVentas = todasLasVentas.length;

    final ticketPromedio = cantidadVentas == 0
        ? 0.0
        : totalVendido / cantidadVentas;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF1E3A5F),
                    Color(0xFF2563EB),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ventas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Historial y seguimiento de ventas',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  final token = TokenSesion.token;
                  if (token != null && token.isNotEmpty) {
                    await context.read<VentaProvider>().cargarVentas(token);
                  }
                },
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    const Text(
                      'Resumen de ventas',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3A5F),
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        _indicador(
                          'Total vendido',
                          'C\$${totalVendido.toStringAsFixed(2)}',
                          Icons.attach_money,
                        ),
                        const SizedBox(width: 8),
                        _indicador(
                          'Transacciones',
                          '$cantidadVentas',
                          Icons.receipt_long,
                        ),
                        const SizedBox(width: 8),
                        _indicador(
                          'Ticket promedio',
                          'C\$${ticketPromedio.toStringAsFixed(2)}',
                          Icons.analytics_outlined,
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    BuscadorVenta(
                      onChanged: (valor) {
                        setState(() => busqueda = valor);
                      },
                    ),

                    const SizedBox(height: 15),

                    Filtro(
                      opciones: filtros,
                      seleccionado: filtroSeleccionado,
                      onSeleccionado: (valor) {
                        setState(() => filtroSeleccionado = valor);
                      },
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Historial de ventas',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E3A5F),
                          ),
                        ),
                        Text('${ventasFiltradas.length} registros'),
                      ],
                    ),

                    const SizedBox(height: 12),

                    if (provider.cargando && todasLasVentas.isEmpty)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else if (provider.error != null &&
                        todasLasVentas.isEmpty)
                      _mensaje(
                        'Error al cargar ventas:\n${provider.error}',
                        Icons.error_outline,
                      )
                    else if (ventasFiltradas.isEmpty)
                      _mensaje(
                        'No se encontraron ventas.',
                        Icons.receipt_long_outlined,
                      )
                    else
                      ...ventasFiltradas.map(
                        (venta) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Tarjetaventa(venta: venta),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indicador(String titulo, String valor, IconData icono) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icono, color: const Color(0xFF2563EB), size: 21),
            const SizedBox(height: 9),
            Text(
              valor,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A5F),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              titulo,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mensaje(String mensaje, IconData icono) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Icon(icono, size: 40, color: Colors.grey),
          const SizedBox(height: 10),
          Text(
            mensaje,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
