import 'package:flutter/material.dart';
import '../../../../data/models/inventario_model.dart';

class TarjetaProduct extends StatelessWidget {
  final InventarioModel producto;

  const TarjetaProduct({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: const Icon(
          Icons.pets_rounded,
          size: 35,
          color: Color(0xFF1E3A5F),
        ),
        title: Text(
          producto.nombreProducto?.isNotEmpty == true
              ? producto.nombreProducto!
              : producto.descripcion,
          style: const TextStyle(
            color: Color(0xFF1E3A5F),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Stock: ${producto.stock}'),
        trailing: Text(
          'C\$${producto.precio.toStringAsFixed(2)}',
          style: const TextStyle(
            color: Color(0xFF087A4B),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}