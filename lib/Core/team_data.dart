import 'package:flutter/material.dart';

class TemaApp {
  static ValueNotifier<ThemeMode> tema = ValueNotifier(ThemeMode.system);

  static ThemeData temaClaro = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 134, 209, 247),
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontFamily: 'sans-serif',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontFamily: 'sans-serif',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: 'sans-serif',
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontFamily: 'sans-serif',
        color: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E3A5F),
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
  );

  static ThemeData temaOscuro = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 134, 209, 247),
      brightness: Brightness.dark,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontFamily: 'sans-serif',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontFamily: 'sans-serif',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: 'sans-serif',
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontFamily: 'sans-serif',
        color: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E3A5F),
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
  );
}
