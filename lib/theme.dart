import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  textTheme: const TextTheme(),
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  textTheme: const TextTheme().copyWith(
    bodyLarge: const TextStyle(color: Colors.white),
    bodyMedium: const TextStyle(color: Colors.white),
    displayLarge: const TextStyle(color: Colors.white),
    displayMedium: const TextStyle(color: Colors.white),
    displaySmall: const TextStyle(color: Colors.white),
    headlineMedium: const TextStyle(color: Colors.white),
    headlineSmall: const TextStyle(color: Colors.white),
    titleLarge: const TextStyle(color: Colors.white),
    titleMedium: const TextStyle(color: Colors.white),
    titleSmall: const TextStyle(color: Colors.white),
    labelLarge: const TextStyle(color: Colors.white),
    labelSmall: const TextStyle(color: Colors.white),
  ),
);
