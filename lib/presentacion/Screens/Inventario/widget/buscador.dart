import 'package:flutter/material.dart';

class BuscadorProducto extends StatelessWidget {
  final ValueChanged<String> onBuscar;

  const BuscadorProducto({super.key, required this.onBuscar});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Buscar producto',
      leading: const Icon(Icons.search),
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
      onChanged: onBuscar,
    );
  }
}