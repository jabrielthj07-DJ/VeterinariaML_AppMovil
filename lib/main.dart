
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:veterinaria_ml_movil/Core/Routes/team_data.dart'
    as team_data;
import 'package:veterinaria_ml_movil/Core/Routes/rutas_navegacion.dart';
import 'package:veterinaria_ml_movil/Core/di/inyection.dart';

import 'package:veterinaria_ml_movil/presentacion/Screens/login/widget/w_login.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/Inventario/inventario_screen.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/principal_Screen/principalScreen.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/ventas/ventas_screen.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/perfil/perfil_screen.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/Inicio/inicio_screem.dart';
import 'package:veterinaria_ml_movil/presentacion/Screens/configuracion/confi_screen.dart';

import 'package:veterinaria_ml_movil/presentacion/providers/productoProvider.dart';
import 'package:veterinaria_ml_movil/presentacion/providers/inicioProvider.dart';
import 'package:veterinaria_ml_movil/presentacion/providers/ventaProvider.dart';
import 'package:veterinaria_ml_movil/presentacion/providers/categoriaProvider.dart';
import 'package:veterinaria_ml_movil/presentacion/providers/perfilProvider.dart';
import 'package:veterinaria_ml_movil/presentacion/providers/inventarioProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        ChangeNotifierProvider(create: (context) => ProductoProvider()),
        ChangeNotifierProvider(create: (context) => VentaProvider()),
        ChangeNotifierProvider(create: (context) => CategoriaProvider()),
        ChangeNotifierProvider(create: (context) => InicioProvider()),
      ],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: team_data.TemaApp.tema,
        builder: (context, temaActual, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: team_data.TemaApp.temaClaro,
            darkTheme: team_data.TemaApp.temaOscuro,
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
