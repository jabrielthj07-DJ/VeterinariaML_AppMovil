
import 'package:get_it/get_it.dart';

import '../network/api.via.dart';
import '../../services/authService.dart';

final GetIt getIt = GetIt.instance;

void configurarDependencias() {
  if (getIt.isRegistered<ApiClient>()) return;

  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(),
  );

  getIt.registerLazySingleton<AuthService>(
    () => AuthService(getIt<ApiClient>()),
  );
}
