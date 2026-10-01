import 'package:flutter/material.dart';
import 'package:veterinaria_ml_movil/Screens/login/widget/w_login.dart';
import './Core/rutas_navegacion.dart';

// Pantallas de Interfaces
import './Screens/Inventario/inventario_screen.dart';
import './Screens/principal_Screen/principalScreen.dart';
import './Screens/login/login_Screen.dart';
import './Screens/ventas/ventas_screen.dart';
import 'Screens/perfil/perfil_screen.dart';
import 'Screens/Inicio/inicio_screem.dart';
import 'Screens/configuracion/confi_screen.dart';

// Tema global
import './Core/team_data.dart';

void main() {
  runApp(const App_Veterinaria());
}

class App_Veterinaria extends StatelessWidget {
  const App_Veterinaria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RutasNavegacion.login,
      routes: {
       RutasNavegacion.login: (context) => loginScreen(), 
        RutasNavegacion.inicio: (context) => const InicioScreen(),
        RutasNavegacion.principal: (context) => const PrincipalScreen(),
        RutasNavegacion.inventario: (context) => const InventarioScreen(),
        RutasNavegacion.ventas: (context) => const VentasScreen(),
        RutasNavegacion.perfil: (context) => const PerfilScreen(),

    //Ejecuta los cambios del tema global para aplicar en todas las pantallas
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: TemaApp.tema,
      builder: (context, temaActual, child) {

        return MaterialApp(

          theme: TemaApp.temaClaro,
          darkTheme: TemaApp.temaOscuro,
          themeMode: temaActual,

          initialRoute: RutasNavegacion.login,

          routes: {

            RutasNavegacion.login: (context) => loginScreen(), 
            RutasNavegacion.inicio: (context) => const InicioScreen(),
            RutasNavegacion.principal: (context) => const PrincipalScreen(),
            RutasNavegacion.inventario: (context) => const InventarioScreen(),
            RutasNavegacion.ventas: (context) => const VentasScreen(),
            RutasNavegacion.perfil: (context) => const PerfilScreen(),
            RutasNavegacion.configuracion: (context) => const ConfiguracionScreen(),
          },
        );
      },
    );
  }
}
