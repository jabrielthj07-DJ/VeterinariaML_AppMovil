import 'package:flutter/material.dart';
import 'widget/w_confi.dart';

class ConfiguracionScreen extends StatelessWidget {
  const ConfiguracionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Configuracion'),
      ),
      body: const WConfi(),
    );
  }
}
