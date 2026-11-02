import 'package:flutter/material.dart';

class BuscadorProducto extends StatelessWidget {
  final ValueChanged<String> onBuscar;

  const BuscadorProducto({
    super.key,
    required this.onBuscar,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Buscar producto',
      leading: const Icon(Icons.search),
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      onChanged: onBuscar,
    );
  }
}