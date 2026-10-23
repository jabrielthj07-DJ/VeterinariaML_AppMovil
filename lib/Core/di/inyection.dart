import 'package:get_it/get_it.dart';

import '../network/api.via.dart';

import '../../services/authService.dart';
import '../../services/inventarioService.dart';
import '../../services/productoService.dart';
import '../../services/categoriaService.dart';
import '../../services/ventaService.dart';

import '../../data/repositories/inventarioRepository.dart';
import '../../data/repositories/productoRepository.dart';
import '../../data/repositories/categoriaRepository.dart';
import '../../data/repositories/VentaRepository.dart';

final GetIt getIt = GetIt.instance;

void configurarDependencias() {
  if (!getIt.isRegistered<ApiClient>()) {
    getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  }

  if (!getIt.isRegistered<AuthService>()) {
    getIt.registerLazySingleton<AuthService>(
      () => AuthService(getIt<ApiClient>()),
    );
  }

  if (!getIt.isRegistered<InventarioService>()) {
    getIt.registerLazySingleton<InventarioService>(
      () => InventarioService(getIt<ApiClient>()),
    );
  }

  if (!getIt.isRegistered<InventarioRepository>()) {
    getIt.registerLazySingleton<InventarioRepository>(
      () => InventarioRepository(getIt<InventarioService>()),
    );
  }

  if (!getIt.isRegistered<ProductoService>()) {
    getIt.registerLazySingleton<ProductoService>(
      () => ProductoService(getIt<ApiClient>()),
    );
  }

  if (!getIt.isRegistered<ProductoRepository>()) {
    getIt.registerLazySingleton<ProductoRepository>(
      () => ProductoRepository(getIt<ProductoService>()),
    );
  }

  if (!getIt.isRegistered<CategoriaService>()) {
    getIt.registerLazySingleton<CategoriaService>(
      () => CategoriaService(getIt<ApiClient>()),
    );
  }

  if (!getIt.isRegistered<CategoriaRepository>()) {
    getIt.registerLazySingleton<CategoriaRepository>(
      () => CategoriaRepository(getIt<CategoriaService>()),
    );
  }

  if (!getIt.isRegistered<VentaService>()) {
    getIt.registerLazySingleton<VentaService>(
      () => VentaService(getIt<ApiClient>()),
    );
  }

  if (!getIt.isRegistered<VentaRepository>()) {
    getIt.registerLazySingleton<VentaRepository>(
      () => VentaRepository(getIt<VentaService>()),
    );
  }
}
