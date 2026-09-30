import 'package:flutter/material.dart';

class ConfiguracionScreen extends StatelessWidget
{
  const ConfiguracionScreen
  (
    {
      super.key,
    }
  );

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        centerTitle: true,
        title: const Text('Configuracion'),
      ),

    body: const Center(
  child: Text('Configuración'),
),

// Cuando agregues los widgets

      // body: const ConfiguracionScreen(),
    );
  }
}