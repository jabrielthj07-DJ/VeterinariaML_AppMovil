import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veterinaria_ml_movil/Core/Routes/rutas_navegacion.dart';
import 'package:veterinaria_ml_movil/Core/Routes/team_data.dart';
import 'package:veterinaria_ml_movil/Core/di/inyection.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/Inicio/inicio_screem.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/Inventario/inventario_screen.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/configuracion/confi_screen.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/login/widget/w_login.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/perfil/perfil_screen.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/principal_Screen/principalScreen.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/ventas/ventas_screen.dart';
import 'package:veterinaria_ml_movil/presentacion/providers/configProvider.dart';
import 'package:veterinaria_ml_movil/presentacion/providers/inicioProvider.dart';
import 'package:veterinaria_ml_movil/presentacion/providers/inventarioProvider.dart';
import 'package:veterinaria_ml_movil/presentacion/providers/perfilProvider.dart';
import 'package:veterinaria_ml_movil/presentacion/providers/principalProvider.dart';
import 'package:veterinaria_ml_movil/presentacion/providers/ventaProvider.dart';

void main() {
  configurarDependencias();
  runApp(const App_Veterinaria());
}

class App_Veterinaria extends StatelessWidget {
  const App_Veterinaria({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InventarioProvider()),
        ChangeNotifierProvider(create: (_) => PerfilProvider()),
        ChangeNotifierProvider(create: (_) => ConfigProvider()),
        ChangeNotifierProvider(create: (_) => VentaProvider()),
        ChangeNotifierProvider(create: (_) => PrincipalProvider()),
        ChangeNotifierProvider(create: (_) => InicioProvider()),
      ],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: TemaApp.tema,
        builder: (context, temaActual, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
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
              RutasNavegacion.configuracion: (context) =>
                  const ConfiguracionScreen(),
            },
          );
        },
      ),
    );
  }
}
