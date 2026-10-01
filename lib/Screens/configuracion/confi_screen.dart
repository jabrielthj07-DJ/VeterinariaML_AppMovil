import 'package:flutter/material.dart';
import 'widget/w_confi.dart';

class ConfiguracionScreen extends StatelessWidget {
  const ConfiguracionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('Configuracion'),
      // ),

      body: Column(
  children: [
    Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF174B5B),
            Color(0xFF7BD0F3),
          ],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Configuración',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),

    const Expanded(
      child: WConfi(),
    ),
  ],
),
    );
  }
}
