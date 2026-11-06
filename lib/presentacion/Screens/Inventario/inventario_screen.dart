import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:veterinaria_ml_movil/presentacion/providers/inventarioProvider.dart';

import 'widget/tarjetas.dart';
import 'widget/buscador.dart';
import 'widget/filtro.dart';

class InventarioScreen extends StatefulWidget {
  const InventarioScreen({super.key});

  @override
  State<InventarioScreen> createState() => _InventarioScreenState();
}

class _InventarioScreenState extends State<InventarioScreen> {
  String busqueda = '';
  int filtro = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<InventarioProvider>().cargarInventarioSesion();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InventarioProvider>();

    final productos = provider.inventario.where((p) {
      final nombre = p.nombreProducto ?? p.descripcion;

      final buscar = nombre.toLowerCase().contains(busqueda.toLowerCase());

      final stock = filtro == 0 ||
          (filtro == 1 && p.stock > 0 && p.stock <= 5) ||
          (filtro == 2 && p.stock == 0);

      return buscar && stock;
    }).toList();

    return Scaffold(
     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // Color(0xFF1E3A5F),
                    // Color(0xFF2563EB),
                     Color(0xFF174B5B),
                    Color(0xFF7BD0F3),
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
                    'Inventario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ), 
             ],
            ),
            
          ),

          const SizedBox(height: 14),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BuscadorProducto(
              onBuscar: (texto) => setState(() => busqueda = texto),
            ),
          ),

          const SizedBox(height: 13),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Filtro(
              seleccionado: filtro,
              onCambiar: (valor) => setState(() => filtro = valor),
            ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: provider.cargando
                ? const Center(child: CircularProgressIndicator())
                : provider.error != null
                    ? Center(child: Text(provider.error!))
                    : RefreshIndicator(
                        onRefresh: provider.cargarInventarioSesion,
                        child: productos.isEmpty
                            ? ListView(
                                children: const [
                                  SizedBox(height: 100),
                                  Center(child: Text('No hay productos')),
                                ],
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.all(12),
                                itemCount: productos.length,
                                itemBuilder: (context, index) {
                                  return TarjetaProduct(
                                    producto: productos[index],
                                  );
                                },
                              ),
                      ),
          ),
        ],
      ),
    ),
    );
  }
}