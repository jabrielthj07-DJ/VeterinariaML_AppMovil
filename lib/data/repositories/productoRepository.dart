import '../models/producto_model.dart';
import '../../services/productoService.dart';

class ProductoRepository {
  final ProductoService _service;

  ProductoRepository(this._service);

  Future<List<ProductoModel>> obtenerProductos(String token) async {
    final respuesta = await _service.obtenerProductos(token);

    if (respuesta == null) return [];

    return (respuesta as List)
        .map((item) => ProductoModel.fromJson(
              Map<String, dynamic>.from(item),
            ))
        .toList();
  }

  Future<ProductoModel> obtenerProductoPorId(
    int idProducto,
    String token,
  ) async {
    final respuesta = await _service.obtenerProductoPorId(idProducto, token);

    return ProductoModel.fromJson(
      Map<String, dynamic>.from(respuesta),
    );
  }
}