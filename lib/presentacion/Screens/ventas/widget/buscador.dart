import 'package:flutter/material.dart';

class BuscadorVenta extends StatelessWidget {
  final ValueChanged<String> onBuscar;

  const BuscadorVenta({super.key, required this.onBuscar});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Buscar venta',
      leading: const Icon(Icons.search),
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
      onChanged: onBuscar,
    );
  }
}