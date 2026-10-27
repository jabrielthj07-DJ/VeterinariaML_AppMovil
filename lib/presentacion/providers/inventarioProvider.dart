import 'package:flutter/material.dart';
import '../../data/repositories/inventarioRepository.dart';
import '../../data/models/inventario_model.dart';
// import 'package:provider/provider.dart';
import '../../Core/di/inyection.dart';
import '../../Core/constants/sesionToken.dart';

class InventarioProvider extends ChangeNotifier {
 final InventarioRepository _repository =
      getIt<InventarioRepository>();

  List<InventarioModel> inventario = [];
  bool cargando = false;
  String? error;


Future<void> cargarInventarioSesion() async {
  final token = TokenSesion.token;

  if (token == null || token.isEmpty) {
    error = 'Iniciá sesión para consultar el inventario';
    notifyListeners();
    return;
  }

  await cargarInventario(token);
}

  Future<void> cargarInventario(String token) async {
    cargando = true;
    error = null;
    notifyListeners();

    try {
      inventario = await _repository.obtenerInventario(token);
    } catch (e) {
      error = e.toString();
    } finally {
      cargando = false;
      notifyListeners();
    }
  }

}


