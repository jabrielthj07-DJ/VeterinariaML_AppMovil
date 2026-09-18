import 'package:flutter/material.dart';

class Btnclass extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Btnclass({
    super.key,
    required this.text, // texto del botón, utillizar rapidamente pa todas las interfaces, Ciclarlo en login Jefferson toston
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, 
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

// Referencias:

// url: https://api.flutter.dev/flutter/dart-ui/VoidCallback.html Esta es documentacion oficial, es del callbackvoid
// url: https://api.flutter.dev/flutter/dart-core/double/infinity-constant.html