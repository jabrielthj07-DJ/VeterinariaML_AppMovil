import 'package:flutter/material.dart';

import 'widget/w_perfil.dart';

class PerfilScreen extends StatelessWidget
{
  const PerfilScreen
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
      // appBar: AppBar
      // (
      //   centerTitle: true,
      //   title:  Text('Mi Perfil',
      //    style: Theme.of(context).textTheme.titleLarge,
      //    ),
      // ),
      
      body: const WPerfil(),
    );
  }
}

