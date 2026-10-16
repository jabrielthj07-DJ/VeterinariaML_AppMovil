import 'package:flutter/material.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/login/widget/w_login.dart';
import 'Core/Routes/rutas_navegacion.dart';
import 'package:provider/provider.dart';
// Injection
import 'Core/di/inyection.dart';

// Providers
import './presentacion/providers/configProvider.dart';
import './presentacion/providers/inicioProvider.dart';
import './presentacion/providers/ventaProvider.dart';
import './presentacion/providers/principalProvider.dart';
import './presentacion/providers/perfilProvider.dart';
import './presentacion/providers/inventarioProvider.dart';

// Pantallas de Interfaces
import 'presentacion/Screens/Inventario/inventario_screen.dart';
import 'presentacion/Screens/principal_Screen/principalScreen.dart';
import 'presentacion/Screens/ventas/ventas_screen.dart';
import 'presentacion/Screens/perfil/perfil_screen.dart';
import 'presentacion/Screens/Inicio/inicio_screem.dart';
import 'presentacion/Screens/configuracion/confi_screen.dart';
 
// Tema global
import 'Core/Routes/team_data.dart';
 
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
        ChangeNotifierProvider(create: (context) => InventarioProvider()),
        ChangeNotifierProvider(create: (context) => PerfilProvider()),
        ChangeNotifierProvider(create: (context) => ConfigProvider()),
        ChangeNotifierProvider(create: (context) => VentaProvider()),
        ChangeNotifierProvider(create: (context) => PrincipalProvider()),
        ChangeNotifierProvider(create: (context) => InicioProvider()),
      ],

      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: TemaApp.tema,
        builder: (context, temaActual, child) {

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
              RutasNavegacion.configuracion: (context) => const ConfiguracionScreen(),
            },
          );
        },
      ),
    );
  }
}