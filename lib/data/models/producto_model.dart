class ProductoModel {
  final int idProducto;
  final String nombreProducto;
  final String descripcion;
  final int? idCategoria;

  ProductoModel({
    required this.idProducto,
    required this.nombreProducto,
    required this.descripcion,
    this.idCategoria,
  });

  factory ProductoModel.fromJson(Map<String, dynamic> json) {
    return ProductoModel(
      idProducto: (json['Id_Producto'] ?? json['id_Producto'] ?? json['idProducto'] ?? 0) as int,
      nombreProducto: json['Nombre_Producto'] ?? json['nombre_Producto'] ?? json['nombreProducto'] ?? '',
      descripcion: json['Descripcion'] ?? json['descripcion'] ?? '',
      idCategoria: json['Id_Categoria'] ?? json['id_Categoria'] ?? json['idCategoria'],
    );
  }
}


