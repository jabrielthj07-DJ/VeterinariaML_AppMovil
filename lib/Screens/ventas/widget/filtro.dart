import 'package:flutter/material.dart';

// Mejorar y hacerlo que cambie el nombre, o tengan nombres individuales
class Filtro extends StatefulWidget {
  const Filtro ({super.key});

  @override
  State<Filtro> createState() => _FiltroState();
}

class _FiltroState extends State<Filtro> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {

    return Row(
          crossAxisAlignment: .start,
          mainAxisAlignment: .center,

          children: <Widget>[
            Wrap(
              spacing: 10.0, //entre ellos
              children: List<Widget>.generate(3, (int index) {
                return ChoiceChip(
                  label: Text('Recientes'
                  ),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;

            
                    });
                  },
                );
              }).toList(),
            ),
          ],
    );
  }
}

//https://api.flutter.dev/flutter/material/FilterChip-class.html

// Filtro pero por seleccion multiple

// usar este para inventario 

// https://api.flutter.dev/flutter/material/ChoiceChip-class.html

