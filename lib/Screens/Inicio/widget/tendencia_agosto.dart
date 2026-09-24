import 'package:flutter/material.dart';

class TendenciaAgosto extends StatefulWidget {
  const TendenciaAgosto({super.key});

 @override
  State<TendenciaAgosto> createState() => _TendenciaAgostoState();
}

class _TendenciaAgostoState extends State<TendenciaAgosto> {
  double semana1 = 65;
  double semana2 = 57;
  double semana3 = 62;
  double semana4 = 40;

 @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tendencia de agosto',
                style: TextStyle(
                  color: Color(0xFF164F3C),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '+14% vs julio',
                style: TextStyle(
                  color: Color(0xFF2E8B62),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: CustomPaint(
          size: const Size(double.infinity, 100),
              isComplex: true,
              willChange: false,
              painter: TendenciaPainter(
                semana1: semana1,
                semana2: semana2,
                semana3: semana3,
                semana4: semana4,
              ),
            child: const SizedBox.expand(),
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('S1'),
              Text('S2'),
              Text('S3'),
              Text('S4'),
            ],
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  semana4 = semana4 == 30 ? 40 : 30;
                });
              },
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Actualizar'),
            ),
          ),
        ],
      ),
    );
  }
}

class TendenciaPainter extends CustomPainter {
  final double semana1;
  final double semana2;
  final double semana3;
  final double semana4;

  TendenciaPainter({
    required this.semana1,
    required this.semana2,
    required this.semana3,
    required this.semana4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final valores = <double>[semana1, semana2, semana3, semana4];
    final puntos = <Offset>[];
    final separacion = size.width / (valores.length - 1);

    for (var index = 0; index < valores.length; index++) {
      final valor = valores[index].clamp(0, 100).toDouble();
      final x = separacion * index;
      final y = size.height - (valor / 100 * size.height);
      puntos.add(Offset(x, y));
    }

    final guia = Paint()
      ..color = const Color(0xFFE8F0EC)
      ..strokeWidth = 1;
    for (var index = 1; index < 4; index++) {
      final y = size.height * index / 4;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), guia);
    }

    final linea = Paint()
      ..color = const Color(0xFFF59D18)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final ruta = Path()..moveTo(puntos.first.dx, puntos.first.dy);
    for (final punto in puntos.skip(1)) {
      ruta.lineTo(punto.dx, punto.dy);
    }

    final area = Path.from(ruta)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      area,
      Paint()..color = const Color(0xFFF59D18).withOpacity(0.12),
    );
    canvas.drawPath(ruta, linea);

    final punto = Paint()..color = const Color(0xFFF59D18);
    final centro = Paint()..color = Colors.white;
    for (final posicion in puntos) {
      canvas.drawCircle(posicion, 5, punto);
      canvas.drawCircle(posicion, 2, centro);
    }
  }

  @override
  bool shouldRepaint(covariant TendenciaPainter oldDelegate) {
    return semana1 != oldDelegate.semana1 ||
        semana2 != oldDelegate.semana2 ||
        semana3 != oldDelegate.semana3 ||
        semana4 != oldDelegate.semana4;
  }
}