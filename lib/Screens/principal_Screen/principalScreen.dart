import 'package:flutter/material.dart';

import '../Inventario/inventario_screen.dart';
import '../../Widgets/menu.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({super.key});

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
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