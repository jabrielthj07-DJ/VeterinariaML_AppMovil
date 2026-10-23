import '../Core/network/api.via.dart';

class AuthService {
  final ApiClient _api;

  AuthService(this._api);

  Future<Map<String, dynamic>> iniciarSesion(
    String correo,
    String clave,
  ) async {
    final respuesta = await _api.post(
      'Login/login',
      {
        'correo': correo,
        'clave': clave,
      },
    );

    return Map<String, dynamic>.from(respuesta);
  }
}