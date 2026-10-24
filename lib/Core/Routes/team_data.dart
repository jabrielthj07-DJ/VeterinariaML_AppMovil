import 'package:flutter/material.dart';

class TemaApp {
  // AGREGADO: tema seleccionado globalmente
  static final ValueNotifier<ThemeMode> tema =
      ValueNotifier<ThemeMode>(ThemeMode.system);

  // AGREGADO: colores de la aplicación
  static const Color azul = Color(0xFF1E3A5F);
  static const Color verde = Color(0xFF087A4B);
  static const Color celeste = Color(0xFF7BD0F3);

  // AGREGADO: tema claro
  static final ThemeData temaClaro = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: celeste,
      brightness: Brightness.light,
    ).copyWith(
      primary: azul,
      secondary: verde,
      surface: const Color(0xFFF9FAFB),
    ),
    scaffoldBackgroundColor: const Color(0xFFF9FAFB),

    appBarTheme: const AppBarTheme(
      backgroundColor: azul,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: azul,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: azul,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: azul,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Color(0xFF131313),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFF333333),
      ),
    ),
  );

  // AGREGADO: tema oscuro
  static final ThemeData temaOscuro = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: celeste,
      brightness: Brightness.dark,
    ).copyWith(
      primary: celeste,
      secondary: const Color(0xFF81C784),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: azul,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),

    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: azul,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
    ),
  );
}