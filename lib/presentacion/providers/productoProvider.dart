import 'package:flutter/material.dart';
import '../../Core/di/inyection.dart';
import '../../data/repositories/productoRepository.dart';
import '../../data/models/producto_model.dart';

class ProductoProvider extends ChangeNotifier {
  final ProductoRepository _repository = getIt<ProductoRepository>();

  List<ProductoModel> productos = [];
  bool cargando = false;
  String? error;

  Future<void> cargarProductos(String token) async {
    cargando = true;
    error = null;
    notifyListeners();

    try {
      productos = await _repository.obtenerProductos(token);
    } catch (e) {
      error = e.toString();
    } finally {
      cargando = false;
      notifyListeners();
    }
  }
}