
import 'package:flutter/material.dart';

class BuscadorVenta extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const BuscadorVenta({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Buscar venta por número...',
      leading: const Icon(Icons.search),
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
