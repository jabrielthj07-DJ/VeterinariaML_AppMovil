import '../models/venta_model.dart';
import '../../services/ventaService.dart';

class VentaRepository {
  final VentaService _service;

  VentaRepository(this._service);

  Future<List<VentaModel>> obtenerVentas(String token) async {
    final respuesta = await _service.obtenerVentas(token);

    if (respuesta == null) return [];

    return (respuesta as List)
        .map(
          (item) => VentaModel.fromJson(
            Map<String, dynamic>.from(item),
          ),
        )
        .toList();
  }
}