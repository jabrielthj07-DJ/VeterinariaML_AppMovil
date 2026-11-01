
import 'package:flutter/material.dart';
import '../../../../data/models/venta_model.dart';

class Tarjetaventa extends StatelessWidget {
  final VentaModel venta;

  const Tarjetaventa({
    super.key,
    required this.venta,
  });

  @override
  Widget build(BuildContext context) {
    final cantidad = venta.detalles.fold<int>(
      0,
      (total, detalle) => total + detalle.cantidad,
    );

    return Card(
      color: Colors.white,
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 8,
        ),
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFE8F0FE),
          child: Icon(
            Icons.receipt_long,
            color: Color(0xFF1E3A5F),
          ),
        ),
        title: Text(
          'Venta V-${venta.idVenta}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E3A5F),
          ),
        ),
        subtitle: Text(
          '$cantidad productos • ${venta.fechaVenta.day}/${venta.fechaVenta.month}/${venta.fechaVenta.year}',
        ),
        trailing: Text(
          'C\$${venta.total.toStringAsFixed(2)}',
          style: const TextStyle(
            color: Color(0xFF087A4B),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        onTap: () => _mostrarDetalle(context),
      ),
    );
  }

  void _mostrarDetalle(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Venta V-${venta.idVenta}'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Fecha: ${venta.fechaVenta.day}/${venta.fechaVenta.month}/${venta.fechaVenta.year}',
                  ),
                  const Divider(height: 24),
                  const Text(
                    'Productos vendidos',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...venta.detalles.map(
                    (detalle) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              '${detalle.nombreProducto}\n'
                              'Cantidad: ${detalle.cantidad}',
                            ),
                          ),
                          Text(
                            'C\$${detalle.precioUnitario.toStringAsFixed(2)}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'C\$${venta.total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF087A4B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
}
