import '../Core/network/api.via.dart';

class InventarioService {
  final ApiClient _api;

  InventarioService(this._api);

  Future<dynamic> obtenerInventario(String token) async {
    return await _api.get('Inventario', token: token);
  }
}