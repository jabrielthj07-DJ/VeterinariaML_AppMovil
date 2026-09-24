import 'package:flutter/material.dart';
import './Core/rutas_navegacion.dart';
<<<<<<< HEAD
import 'Screens/login/widget/w_login.dart';
=======
import './Widgets/menu.dart';

// Pantallas de Interfaces
import './Screens/Inventario/inventario_screen.dart';
import './Screens/principal_Screen/principalScreen.dart';
import './Screens/login/login_Screen.dart';
>>>>>>> develop

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
<<<<<<< HEAD
        RutasNavegacion.login: (context) => loginScreen(),
=======
        //RutasNavegacion.login: (context) => const LoginScreen(),  // revisar 
>>>>>>> develop
        //RutasNavegacion.inicio: (context) => const InicioScreen(),
        //RutasNavegacion.inventario: (context) => const InventarioScreen(),
        //RutasNavegacion.ventas: (context) => const VentasScreen(),
        //RutasNavegacion.perfil: (context) => const PerfilScreen(),
      },
    );
  }
}