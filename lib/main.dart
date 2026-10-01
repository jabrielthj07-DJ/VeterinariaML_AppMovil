import 'package:flutter/material.dart';
import './Core/rutas_navegacion.dart';

// Pantallas de Interfaces
import './Screens/Inventario/inventario_screen.dart';
import './Screens/principal_Screen/principalScreen.dart';
//import './Screens/login/login_Screen.dart';
import './Screens/ventas/ventas_screen.dart';
import 'Screens/perfil/perfil_screen.dart';
import 'Screens/Inicio/inicio_screem.dart';
import 'Screens/configuracion/confi_screen.dart';

void main() {
  runApp(const App_Veterinaria());
}

class App_Veterinaria extends StatelessWidget {
  const App_Veterinaria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // Menu navegcion o segmentaciones
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 134, 209, 247),
      brightness: Brightness.light,
    ),
  
  // Fuentes
  textTheme: const TextTheme(
  titleLarge: TextStyle(  // lo vamos a ocupar pa h1 por ejemplo txt principales
    fontSize: 24,
    fontFamily: 'sans-serif',
    fontWeight: FontWeight.bold,
     color: Colors.white, 
  ),
  titleMedium: TextStyle(  // subtitulos como h2 o h3 en html
    fontSize: 18,
    fontFamily: 'sans-serif',
    fontWeight: FontWeight.bold,
     color: Colors.white, 
  ),
  bodyLarge: TextStyle( // txt importante tipo h1 pero es h4 o h5
    fontSize: 16,
    fontFamily: 'sans-serif',
     color: Colors.white, 
  ),
  bodyMedium: TextStyle( // txt tipo h6 o p
    fontSize: 14,
    fontFamily: 'sans-serif',
     color: Colors.white, 
  ),
),

// Header
appBarTheme: const AppBarTheme(
  backgroundColor: Color(0xFF1E3A5F),
  foregroundColor: Colors.white,
  centerTitle: true,
),

// Tarjetas modificar color (I) en the wbe site
// cardTheme: CardThemeData(
//   elevation: 2,
//   margin: const EdgeInsets.all(8),
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(12),
//   ),
// ),

        ), 

      initialRoute: RutasNavegacion.principal,
      routes: {
        //RutasNavegacion.login: (context) => const loginScreen(),  
        RutasNavegacion.inicio: (context) => const InicioScreen(),
        RutasNavegacion.principal: (context) => const PrincipalScreen(),
        RutasNavegacion.inventario: (context) => const InventarioScreen(),
        RutasNavegacion.ventas: (context) => const VentasScreen(),
        RutasNavegacion.perfil: (context) => const PerfilScreen(),
         RutasNavegacion.configuracion: (context) => const ConfiguracionScreen(),
      },
    );
  }
}