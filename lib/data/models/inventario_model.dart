
class InventarioModel {
  final int idInventario;
  final String descripcion;
  final double precio;
  final int stock;
  final int? idProducto;
  final String? nombreProducto;

  InventarioModel({
    required this.idInventario,
    required this.descripcion,
    required this.precio,
    required this.stock,
    this.idProducto,
    this.nombreProducto,
  });

  factory InventarioModel.fromJson(Map<String, dynamic> json) {
    return InventarioModel(
    idInventario: (json['Id_Inventario'] ?? json['id_Inventario'] ?? json['idInventario'] ?? 0) as int,
      descripcion: json['Descripcion'] ?? json['descripcion'] ?? '',
      precio: ((json['Precio'] ?? json['precio'] ?? 0) as num).toDouble(),
      stock: (json['Stock'] ?? json['stock'] ?? 0) as int,
      idProducto: json['Id_Producto'] ?? json['id_Producto'] ?? json['idProducto'],
      nombreProducto: json['Nombre_Producto'] ?? json['nombre_Producto'] ?? json['nombreProducto'],
    );
  }
}
