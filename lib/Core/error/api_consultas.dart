
// agregar la 404, 201 pal P , y 500/svr  etc status
class ValidacionesApiu{

 static void validar(int codigo) {
    if (codigo >= 200 && codigo < 300) {
      return;
    }

    if (codigo == 401) {
      throw Exception('No Tienes autorizacion... Inicia sesión nuevamente.');
    }

    if (codigo == 403) {
      throw Exception(' No tenes permiso para realizar esta consulta ');
    }

    if (codigo == 404) {
      throw Exception('No se encontró lo solicitado');
    }

    if (codigo >= 500) {
      throw Exception('Error del servidor.');
    }

    throw Exception('Error en la API Código: $codigo');
  }
}