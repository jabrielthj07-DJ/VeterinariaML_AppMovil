import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final int currentPageIndex;
  final ValueChanged<int> onDestinationSelected;

  const Menu({
    super.key,
    required this.currentPageIndex, // numero de la pageg
    required this.onDestinationSelected, // funcion q revisa el numero (por si acaso, lo q toque en la p antalla) tipo list 
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentPageIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination( // B BTN - Lo mismo con L DMs
          icon: Icon(Icons.home_outlined), // Cuando no esta seleccionado sucesivamente
          selectedIcon: Icon(Icons.home), // Cuando esta seleccionado sucesivamente
          label: 'Inicio',
        ),
        NavigationDestination(
          icon: Icon(Icons.analytics_outlined),
          selectedIcon: Icon(Icons.analytics),
          label: 'Ventas',
        ),
        NavigationDestination(
          icon: Icon(Icons.inventory_2_outlined),
          selectedIcon: Icon(Icons.inventory_2),
          label: 'Inventario',
        ),
        NavigationDestination(
          icon: Icon(Icons.account_circle_outlined),
          selectedIcon: Icon(Icons.account_circle),
          label: 'Perfil',
        ),
      ],
    );
  }
}

// Referencia: 

// https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html

//Nota: cualquier cosa pueden ir a Recursos pal proyecto, ahi hay info util