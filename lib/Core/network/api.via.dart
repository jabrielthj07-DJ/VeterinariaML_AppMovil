// permite crear de Json a map, dynamico / lo q viene dentro de here is Jsondecode*() eye: no siempre es map va variando con lista o con otras cosas
import 'dart:convert'; 
import 'package:http/http.dart' as http; // paaa instalarlo usa un flutter pub add http y te lo instala
import '../constants/api.dart';

import '../error/api_consultas.dart'; 

class ApiClient {
  final _client = http.Client();

  Future<dynamic> get(String path, {Map<String, String>? query,String? token,}) async {

    final uri = Uri.parse('${ApiConstant.bsUrl}/$path')
        .replace(queryParameters: query);

    final response = await _client.get( uri, headers: {
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );

    ValidacionesApiu.validar(response.statusCode);

    if (response.statusCode == 204 || response.body.isEmpty) {
      return null;
    }

    return jsonDecode(response.body);
  }

// Oe este es solo pal login
  Future<dynamic> post(
    String path,
    Map<String, dynamic> datos,
  ) async {
    final uri = Uri.parse('${ApiConstant.bsUrl}/$path');

    final response = await _client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(datos),
    );
    // Prueba pa ver el error
if (response.statusCode < 200 || response.statusCode >= 300) {
  throw Exception(
    'Error HTTP ${response.statusCode}: ${response.body}',
  );
}

    if (response.body.isEmpty) {
      return null;
    }

    return jsonDecode(response.body);
  }
}
