import '../Core/network/api.via.dart';

class VentaService {
  final ApiClient _api;

  VentaService(this._api);

  Future<dynamic> obtenerVentas(String token) async {
    return await _api.get('Ventas', token: token);
  }

  Future<dynamic> obtenerVentaPorId(
    int idVenta,
    String token,
  ) async {
    return await _api.get('Ventas/$idVenta', token: token);
  }
}