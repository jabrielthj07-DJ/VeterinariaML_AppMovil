import 'package:flutter/material.dart';

class TarjetaProduct extends StatelessWidget {
  const TarjetaProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Shampoo para perros'),
        subtitle: Text('Stock: 15'),
        trailing: Text('\C\$180'),
      ),
    );
  }
}