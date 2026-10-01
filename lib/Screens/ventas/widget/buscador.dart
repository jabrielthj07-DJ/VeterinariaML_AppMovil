import 'package:flutter/material.dart';

class BuscadorVenta extends StatelessWidget {
  const BuscadorVenta({super.key});

  @override
  Widget build(BuildContext context) {
    return  SearchBar(

      hintText: 'Buscar Venta',
       backgroundColor: const WidgetStatePropertyAll(
        Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}

// https://api.flutter.dev/flutter/material/SearchBar-class.html