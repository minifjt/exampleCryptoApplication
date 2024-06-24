import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0,
    centerTitle: true,
    color: Color.fromARGB(221, 59, 59, 59),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  dividerColor: Colors.white24,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(
      color: Colors.white54,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(221, 59, 59, 59),
  useMaterial3: true,
);
