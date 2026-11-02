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

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(opciones.length, (index) {
          final activo = seleccionado == index;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(opciones[index]),
              selected: activo,
              onSelected: (_) => onCambiar(index),
              selectedColor: const Color(0xFF1E3A5F),
              backgroundColor: Colors.white,
              labelStyle: TextStyle(
                color: activo ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              side: BorderSide(
                color: activo
                    ? const Color(0xFF1E3A5F)
                    : Colors.grey.shade300,
              ),
            ),
          );
        }),
      ),
    );
  }
}