import '../Core/network/api.via.dart';
import '../Data/models/producto_model.dart';

class ProductoService {
  final ApiClient _api;

  ProductoService(this._api);

  Future<List<ProductoModel>> obtenerProductos(String token) async {

    final respuesta = await _api.get('Producto', token: token,);

    if (respuesta == null) return []; 

    return (respuesta as List)
        .map((producto) => ProductoModel.fromJson(
              Map<String, dynamic>.from(producto), ))
        .toList();
  }

  Future<ProductoModel> obtenerProductoPorId( int idProducto, String token, ) async {
    final respuesta = await _api.get('Producto/$idProducto', token: token,);

    return ProductoModel.fromJson(
      Map<String, dynamic>.from(respuesta), 
    );
  }
}