import 'package:flutter/material.dart';

class Tarjetaventa extends StatelessWidget {
  const Tarjetaventa({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(223, 237, 244, 248),
      
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
        color: const Color.fromARGB(168, 10, 125, 58),
        fontFamily: 'sans-serif',
        fontSize: 12,
        ),
        ),
        
        trailing: Text('Total: \C\$200',

        style: TextStyle(
        color: const Color.fromARGB(155, 18, 52, 79),
        fontFamily: 'sans-serif',
        fontSize: 14,
        fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}



// Divider class
//https://api.flutter.dev/flutter/material/Divider-class.html

// Listview este preguntar si pa cuando este conectada la api
//https://api.flutter.dev/flutter/widgets/ListView-class.html?utm_source=chatgpt.com

