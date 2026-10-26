
class CategoriaModel {
  final int idCategoria;
  final String nombreCategoria;
  final String descripcion;

  CategoriaModel({
    required this.idCategoria,
    required this.nombreCategoria,
    required this.descripcion,
  });

  factory CategoriaModel.fromJson(Map<String, dynamic> json) {
    return CategoriaModel(
      idCategoria: (json['Id_Categoria'] ?? json['id_Categoria'] ?? json['idCategoria'] ?? 0) as int,
      nombreCategoria: json['Nombre_Categoria'] ?? json['nombre_Categoria'] ?? json['nombreCategoria'] ?? '',
      descripcion: json['Descripcion'] ?? json['descripcion'] ?? '',
    );
  }
}
