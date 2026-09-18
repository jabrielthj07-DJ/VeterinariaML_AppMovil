import 'package:flutter/material.dart';

class InventarioScreen extends StatefulWidget {
  const InventarioScreen({super.key});

  @override
  State<InventarioScreen> createState() => _InventarioScreenState();
}

class _InventarioScreenState extends State<InventarioScreen> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior = .alwaysShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Inicio'),
           NavigationDestination(icon: Icon(Icons.analytics_outlined), label: 'Ventas'),
          NavigationDestination(icon: Icon(Icons.backpack_outlined), label: 'Inventario'),
          NavigationDestination(icon: Icon(Icons.account_circle_outlined), label: 'Perfil'),
        ],
      ),
      body: Center(
        child: Text('Pagina Inventario $currentPageIndex'),
      ),
      );
    }

}