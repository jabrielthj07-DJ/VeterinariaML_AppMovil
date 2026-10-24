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
    final filtros = ['Hoy', 'Ayer', 'Semanal', 'Mensual'];

    return Wrap(
      spacing: 4,
      children: List.generate(filtros.length, (index) {
        return ChoiceChip(
          label: Text(filtros[index]),
          selected: seleccionado == index,
          onSelected: (_) => onCambiar(index),
        );
      }),
    );
  }
}