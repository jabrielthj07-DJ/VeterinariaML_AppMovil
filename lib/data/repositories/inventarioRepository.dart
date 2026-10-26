import '../models/inventario_model.dart';
import '../../services/inventarioService.dart';

class InventarioRepository {
  final InventarioService _service;

  InventarioRepository(this._service);

  Future<List<InventarioModel>> obtenerInventario(String token) async {
    final respuesta = await _service.obtenerInventario(token);

    if (respuesta == null) return [];

    return (respuesta as List)
        .map((item) => InventarioModel.fromJson(
              Map<String, dynamic>.from(item),
            ))
        .toList();
  }
}