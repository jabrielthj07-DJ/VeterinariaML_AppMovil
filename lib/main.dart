import 'package:flutter/material.dart';

import 'Screens/inicio_screem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veterinaria ML',
      debugShowCheckedModeBanner: false,
      
      home: const InicioScreen(),
    );
  }
}


