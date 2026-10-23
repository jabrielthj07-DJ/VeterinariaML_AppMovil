class VentaModel {
  final int idVenta;
  final int idUsuario;
  final DateTime fechaVenta;
  final String nombre;
  final double total;
  final List<DetalleVentaModel> detalles;

  VentaModel({
    required this.idVenta,
    required this.idUsuario,
    required this.fechaVenta,
    required this.nombre,
    required this.total,
    required this.detalles,
  });

  factory VentaModel.fromJson(Map<String, dynamic> json) {
    final lista = json['Detalles'] ?? json['detalles'] ?? [];

    return VentaModel(
      idVenta: (json['Id_Venta'] ?? json['id_Venta'] ?? json['idVenta'] ?? 0) as int,
      idUsuario: (json['Id_Usuario'] ?? json['id_Usuario'] ?? json['idUsuario'] ?? 0) as int,
      fechaVenta: DateTime.tryParse(
            (json['Fecha_Venta'] ?? json['fecha_Venta'] ?? json['fechaVenta'] ?? '').toString(),
          ) ??
          DateTime.now(),
      nombre: json['Nombre'] ?? json['nombre'] ?? '',
      total: ((json['Total'] ?? json['total'] ?? 0) as num).toDouble(),
      detalles: (lista as List)
          .map(
            (detalle) => DetalleVentaModel.fromJson(
              Map<String, dynamic>.from(detalle),
            ),
          )
          .toList(),
    );
  }
}

class DetalleVentaModel {
  final int idDetalleVenta;
  final int idProducto;
  final String nombreProducto;
  final int cantidad;
  final double precioUnitario;

  DetalleVentaModel({
    required this.idDetalleVenta,
    required this.idProducto,
    required this.nombreProducto,
    required this.cantidad,
    required this.precioUnitario,
  });

  factory DetalleVentaModel.fromJson(Map<String, dynamic> json) {
    return DetalleVentaModel(
      idDetalleVenta: (json['Id_Detalle_Venta'] ?? json['id_Detalle_Venta'] ?? json['idDetalleVenta'] ?? 0) as int,
      idProducto: (json['Id_Producto'] ?? json['id_Producto'] ?? json['idProducto'] ?? 0) as int,
      nombreProducto: json['Nombre_Producto'] ?? json['nombre_Producto'] ?? json['nombreProducto'] ?? '',
      cantidad: (json['Cantidad'] ?? json['cantidad'] ?? 0) as int,
      precioUnitario: ((json['Precio_Unitario'] ?? json['precio_Unitario'] ?? json['precioUnitario'] ?? 0) as num).toDouble(),
    );
  }
}