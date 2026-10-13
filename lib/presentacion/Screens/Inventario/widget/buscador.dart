import 'package:flutter/material.dart';

class BuscadorProducto extends StatelessWidget {
  const BuscadorProducto({super.key});

  @override
  Widget build(BuildContext context) {
    return  SearchBar(
      
      hintText: 'Buscar producto',
       backgroundColor: const WidgetStatePropertyAll(
        Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}

// https://api.flutter.dev/flutter/material/SearchBar-class.html