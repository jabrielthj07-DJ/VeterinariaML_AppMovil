import 'package:flutter/material.dart';
import '../../Core/di/inyection.dart';
import '../../data/repositories/ventaRepository.dart';
import '../../data/models/venta_model.dart';

class VentaProvider extends ChangeNotifier {
  final VentaRepository _repository = getIt<VentaRepository>();

  List<VentaModel> ventas = [];
  bool cargando = false;
  String? error;

  Future<void> cargarVentas(String token) async {
    cargando = true;
    error = null;
    notifyListeners();

    try {
      ventas = await _repository.obtenerVentas(token);
    } catch (e) {
      error = e.toString();
    } finally {
      cargando = false;
      notifyListeners();
    }
  }
}