import 'package:flutter/material.dart';
import '../../Core/di/inyection.dart';
import '../../data/repositories/categoriaRepository.dart';
import '../../data/models/categoria_model.dart';

class CategoriaProvider extends ChangeNotifier {
  final CategoriaRepository _repository =
      getIt<CategoriaRepository>();

  List<CategoriaModel> categorias = [];
  bool cargando = false;
  String? error;

  Future<void> cargarCategorias(String token) async {
    cargando = true;
    error = null;
    notifyListeners();

    try {
      categorias = await _repository.obtenerCategorias(token);
    } catch (e) {
      error = e.toString();
    } finally {
      cargando = false;
      notifyListeners();
    }
  }
}