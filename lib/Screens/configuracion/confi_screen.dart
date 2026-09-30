import 'package:flutter/material.dart';

class ConfiScreen extends StatelessWidget
{
  const ConfiScreen
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
        title: const Text('Perfil De Usuario'),
      ),
      body: const ConfiScreen(),
    );
  }
}