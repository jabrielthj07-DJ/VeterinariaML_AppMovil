import 'package:flutter/material.dart';
import './Core/rutas_navegacion.dart';
import 'Screens/login/widget/w_login.dart';

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
        //RutasNavegacion.inicio: (context) => const InicioScreen(),
        //RutasNavegacion.inventario: (context) => const InventarioScreen(),
        //RutasNavegacion.ventas: (context) => const VentasScreen(),
        //RutasNavegacion.perfil: (context) => const PerfilScreen(),
      },
    );
  }
}