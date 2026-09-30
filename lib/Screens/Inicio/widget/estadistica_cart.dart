import 'package:flutter/material.dart';

class EstadisticaCart extends StatelessWidget {
  final String titulo;
  final String valor;
  final String porcentaje;
  final bool alerta;

  const EstadisticaCart({
    super.key,
    required this.titulo,
    required this.valor,
    required this.porcentaje,
    this.alerta = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
    
      decoration: BoxDecoration(
        
         // Indexado Por DJ
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 24, 82, 107),  
          Color.fromARGB(255, 98, 178, 209), 
        ],
        ),
        borderRadius: BorderRadius.circular(18), // Va dentro de BoxDecoration
      border: Border.all(
        color: Colors.white.withOpacity(0.15), // Borde blanco translúcido
      ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            valor,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 7),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: alerta
                  ? Colors.redAccent.withOpacity(0.8)
                  : Colors.orange.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              porcentaje,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}