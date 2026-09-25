import 'package:flutter/material.dart';
import 'widget/w_perfil.dart'; // Importas tu widget de perfil

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'), // Cambié el título por uno más descriptivo
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Hace que los hijos se estiren a lo ancho
          children: [
            // Llamamos a nuestro widget personalizado
            const WPerfil(),
          ],
        ),
      ),
    );
  }
}