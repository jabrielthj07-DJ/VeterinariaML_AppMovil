import 'package:flutter/material.dart';
import './Core/rutas_navegacion.dart';

// Pantallas de Interfaces
import './Screens/Inventario/inventario_screen.dart';
import './Screens/principal_Screen/principalScreen.dart';
//import './Screens/login/login_Screen.dart';
import './Screens/ventas/ventas_screen.dart';
import 'Screens/perfil/perfil_screen.dart';
import 'Screens/Inicio/inicio_screem.dart';

void main() {
  runApp(const App_Veterinaria());
}

class App_Veterinaria extends StatelessWidget {
  const App_Veterinaria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RutasNavegacion.principal,
      routes: {
        //RutasNavegacion.login: (context) => const LoginScreen(),  // revisar 
        RutasNavegacion.inicio: (context) => const InicioScreen(),
        RutasNavegacion.principal: (context) => const PrincipalScreen(),
        RutasNavegacion.inventario: (context) => const InventarioScreen(),
        RutasNavegacion.ventas: (context) => const VentasScreen(),
        RutasNavegacion.perfil: (context) => const PerfilScreen(),
      },
    );
  }
}