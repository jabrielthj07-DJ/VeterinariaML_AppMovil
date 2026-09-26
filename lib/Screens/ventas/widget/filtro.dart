import 'package:flutter/material.dart';

// Mejorar y hacerlo que cambie el nombre, o tengan nombres individuales
class Filtro extends StatefulWidget {
  const Filtro ({super.key});

  @override
  State<Filtro> createState() => _FiltroState();
}

class _FiltroState extends State<Filtro> {
  int? _value = 1;

  final List<String> filtros = [ 
    'Hoy', 
    'Ayer', 
    'semanal',
    'Mensual',
    
    ];

  @override
  Widget build(BuildContext context) {

    return Row(
          crossAxisAlignment: .start,
          mainAxisAlignment: .center,

          children: <Widget>[
            Wrap( //pasa a other line for yes acaso xd
              spacing: 3.0, //entre ellos
              children: List<Widget>.generate(filtros.length, (int index) {
                return ChoiceChip(
                  label: Text(filtros[index]),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;

            
                    });
                  },
                );
              })
            ),
          ],
    );
  }
}

//https://api.flutter.dev/flutter/material/FilterChip-class.html

// Filtro pero por seleccion multiple

// usar este para inventario 

// https://api.flutter.dev/flutter/material/ChoiceChip-class.html

