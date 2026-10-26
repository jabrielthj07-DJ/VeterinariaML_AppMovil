
import 'package:get_it/get_it.dart';

import '../network/api.via.dart';
import '../../services/authService.dart';

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
}
