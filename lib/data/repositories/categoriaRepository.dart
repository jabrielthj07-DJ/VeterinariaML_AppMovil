import '../models/categoria_model.dart';
import '../../services/categoriaService.dart';

class CategoriaRepository {
  final CategoriaService _service;

  CategoriaRepository(this._service);

  Future<List<CategoriaModel>> obtenerCategorias(String token) async {
    final respuesta = await _service.obtenerCategorias(token);

    if (respuesta == null) return [];

    return (respuesta as List)
        .map((item) => CategoriaModel.fromJson(
              Map<String, dynamic>.from(item),
            ))
        .toList();
  }
}