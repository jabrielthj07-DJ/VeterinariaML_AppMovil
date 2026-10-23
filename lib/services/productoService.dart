import '../Core/network/api.via.dart';

class ProductoService {
  final ApiClient _api;

  ProductoService(this._api);

  Future<dynamic> obtenerProductos(String token) async {
    return await _api.get('Producto', token: token);
  }

  Future<dynamic> obtenerProductoPorId(
    int idProducto,
    String token,
  ) async {
    return await _api.get('Producto/$idProducto', token: token);
  }
}