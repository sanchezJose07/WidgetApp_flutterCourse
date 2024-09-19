import 'package:flutter/material.dart';

// Lista de colores para el tema de los iconos de la aplicacion
  const colorsList = <Color>[
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.indigo,
    Colors.amber,
];


// Clase para el tema de la aplicacion
class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }):assert(selectedColor >= 0 && selectedColor < colorsList.length - 1, 
        "Selected value must be between 0 and ${colorsList.length - 1}");

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorsList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: true
      )
    );
  }
}
