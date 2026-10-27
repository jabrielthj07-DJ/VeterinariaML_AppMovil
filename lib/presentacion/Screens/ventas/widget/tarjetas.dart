import 'package:flutter/material.dart';
import '../../../../data/models/venta_model.dart';

class Tarjetaventa extends StatelessWidget {
  final VentaModel venta;

  const Tarjetaventa({super.key, required this.venta});

  @override
  Widget build(BuildContext context) {
    final cantidad = venta.detalles.fold<int>(
      0,
      (total, detalle) => total + detalle.cantidad,
    );

    return Card(
      color: Colors.white,
      child: ListTile(
        leading: const Icon(
          Icons.price_change_outlined,
          size: 35,
          color: Color(0xFF1E3A5F),
        ),
        title: Text(
          'Venta V-${venta.idVenta}',
          style: const TextStyle(
            color: Color(0xFF1E3A5F),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Cantidad de productos: $cantidad'),
        trailing: Text(
          'C\$${venta.total.toStringAsFixed(2)}',
          style: const TextStyle(
            color: Color(0xFF087A4B),
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Venta V-${venta.idVenta}'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fecha: ${venta.fechaVenta.day}/${venta.fechaVenta.month}/${venta.fechaVenta.year}',
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Productos',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  ...venta.detalles.map(
                    (detalle) => Text(
                      '${detalle.nombreProducto} x${detalle.cantidad} - C\$${detalle.precioUnitario.toStringAsFixed(2)}',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Total: C\$${venta.total.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cerrar'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}