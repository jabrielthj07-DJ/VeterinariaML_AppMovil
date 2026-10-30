
import 'package:flutter/material.dart';
import '../../../../data/models/inventario_model.dart';

class TarjetaProduct extends StatelessWidget {
  final InventarioModel producto;

  const TarjetaProduct({
    super.key,
    required this.producto,
  });

  // AGREGADO: Mostrar detalle del producto
  void _mostrarDetalle(BuildContext context) {
    final nombre = producto.nombreProducto?.isNotEmpty == true
        ? producto.nombreProducto!
        : 'Producto';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            nombre,
            style: const TextStyle(
              color: Color(0xFF1E3A5F),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Descripción',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                producto.descripcion.isNotEmpty
                    ? producto.descripcion
                    : 'Sin descripción disponible',
              ),
              const Divider(height: 24),
              Text('Código de inventario: ${producto.idInventario}'),
              if (producto.idProducto != null)
                Text('Código de producto: ${producto.idProducto}'),
              const SizedBox(height: 8),
              Text('Stock disponible: ${producto.stock}'),
              const SizedBox(height: 8),
              Text(
                'Precio: C\$${producto.precio.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Color(0xFF087A4B),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        onTap: () => _mostrarDetalle(context), // AGREGADO
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
