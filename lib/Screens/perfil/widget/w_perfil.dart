import 'package:flutter/material.dart';

class WPerfil extends StatelessWidget {
  const WPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    // Envuelto en un Card para darle un diseño más limpio y moderno
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(1.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Centra los elementos verticalmente
          mainAxisSize: MainAxisSize.min, // Ajusta el tamaño al contenido
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,  // Ajusta la posición del icono
               child:Icon(
                Icons.person, 
                size: 80,
                color: Color.fromARGB(255, 0, 0, 0)
              ),
            ),
            
            const SizedBox(height: 10),
            const Text(
              'Axel Lopez',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              
            ),
            const SizedBox(height: 1),
            const Text(
              'axellopez04@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            
            const Text(
              'Número de teléfono: 505-1234-5678',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Acción al presionar el botón
                },
                child: const Text('Editar Perfil'),
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}