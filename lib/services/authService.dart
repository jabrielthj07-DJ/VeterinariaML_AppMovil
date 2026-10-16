import '../Core/network/api.via.dart';

class AuthService {
  final ApiClient _client;

  AuthService(this._client);

  Future<Map<String, dynamic>> login(
    String correo,
    String clave,
  ) async {
    final respuesta = await _client.post(
      'api/Login/login',
      {
        'Correo': correo,
        'Clave': clave,
      },
    );

    if (respuesta is! Map<String, dynamic>) {
      throw Exception('Respuesta de login inválida.');
    }

    return respuesta;
  }
}