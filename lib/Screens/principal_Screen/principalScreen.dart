import 'package:flutter/material.dart';

import '../inventario/inventario_screen.dart';
import '../../widgets/menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  final List<Widget> pages = const [
    //InicioScreen(),
   // VentasScreen(),
    InventarioScreen(),
    //PerfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],

      bottomNavigationBar: Menu(
        currentPageIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}