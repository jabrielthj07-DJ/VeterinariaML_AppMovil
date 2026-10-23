import '../Core/network/api.via.dart';

class CategoriaService {
  final ApiClient _api;

  CategoriaService(this._api);

  Future<dynamic> obtenerCategorias(String token) async {
    return await _api.get('Categorias', token: token);
  }
}