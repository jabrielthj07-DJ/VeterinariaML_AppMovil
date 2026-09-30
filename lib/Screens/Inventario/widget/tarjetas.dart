import 'package:flutter/material.dart';

class TarjetaProduct extends StatelessWidget {
  const TarjetaProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 134, 209, 247),
      
      child: ListTile(

leading: const Icon(
  Icons.pets_rounded,
  size: 35,
  color: Color(0xFF1E3A5F),
),

        title: Text('Shampoo para perros',
        
        style: TextStyle(
        color: const Color.fromARGB(155, 18, 52, 79),
        fontFamily: 'sans-serif',
        fontSize: 15,
        fontWeight: FontWeight.bold,
        ),
        ),

        subtitle: Text('Stock: 15',

        style: TextStyle(
        color: const Color.fromARGB(168, 10, 125, 58),
        fontFamily: 'sans-serif',
        fontSize: 12,
        ),
        ),
        
        trailing: Text('\C\$180',

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

