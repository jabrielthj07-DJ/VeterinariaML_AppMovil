import 'package:flutter/material.dart';

class Filtro extends StatelessWidget {
  final int seleccionado;
  final ValueChanged<int> onCambiar;

  const Filtro({
    super.key,
    required this.seleccionado,
    required this.onCambiar,
  });

  @override
  Widget build(BuildContext context) {
    final opciones = ['Todos', 'Stock bajo', 'Agotados'];

    return Wrap(
      spacing: 10,
      children: List.generate(opciones.length, (index) {
        return ChoiceChip(
          label: Text(opciones[index]),
          selected: seleccionado == index,
          onSelected: (_) => onCambiar(index),
        );
      }),
    );
  }
}