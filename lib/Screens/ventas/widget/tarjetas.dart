import 'package:flutter/material.dart';

class Tarjetaventa extends StatelessWidget {
  const Tarjetaventa({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 255, 255),      
      child: ListTile(

leading: const Icon(
  Icons.price_change_outlined,
  size: 35,
  color: Color(0xFF1E3A5F),
),

        title: Text('venta V-001',
        
        style: TextStyle(
        color: const Color.fromARGB(155, 18, 52, 79),
        fontFamily: 'sans-serif',
        fontSize: 15,
        fontWeight: FontWeight.bold,
        ),
        ),
      
        subtitle: Text('Cantidad de productos: 4',
        

        style: TextStyle(
        color: const Color.fromARGB(155, 18, 52, 79), 
        fontFamily: 'sans-serif',
        fontSize: 12,
        ),
        ),
        
        trailing: Text('Total: \C\$550',

        style: TextStyle(
        color: const Color.fromARGB(168, 10, 125, 58),
        fontFamily: 'sans-serif',
        fontSize: 14,
        fontWeight: FontWeight.bold,

        
        ),),
        onTap: () {
          showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Detalle de venta'),
        content: const Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Fecha: 26/09/2026'),
    Text('Hora: 10:35 AM'),
    Text('Cantidad de productos: 4'),
    SizedBox(height: 12),
    Text(
      'Productos',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(height: 6),
    Text('Shampoo para perros - C\$180'),
    Text('Collar para perro - C\$120'),
    Text('Alimento para perros - C\$250'),
    SizedBox(height: 12),
    Text(
      'Total: C\$550',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),
      );
    },
  );
        },
      ),
    );
  }
}



// Divider class
//https://api.flutter.dev/flutter/material/Divider-class.html

// Listview este preguntar si pa cuando este conectada la api
//https://api.flutter.dev/flutter/widgets/ListView-class.html?utm_source=chatgpt.com

