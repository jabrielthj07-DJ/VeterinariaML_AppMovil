// permite crear de Json a map, dynamico / lo q viene dentro de here is Jsondecode*() eye: no siempre es map va variando con lista o con otras cosas
import 'dart:convert'; 
import 'package:http/http.dart' as http; // paaa instalarlo usa un flutter pub add http y te lo instala
import '../constants/api.dart';

import '../error/api_consultas.dart'; // modificar esto

class ApiClient {
  final _client = http.Client();


Future<dynamic> get( String path, { Map<String, String>? query, }) async {

 final uri = Uri.parse('${ApiConstant.bsUrl}/$path')
    .replace(queryParameters: query);

  final response = await _client.get(uri);

// preguntar q si agrego un if pa los errores o como lo llamo si por const o por clase

  return jsonDecode(response.body);
}
  
}
