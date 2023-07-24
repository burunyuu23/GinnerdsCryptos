import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
    scaffoldBackgroundColor: Colors.black12,
    useMaterial3: true,
    dividerColor: Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w900)),
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        labelSmall: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 20,
        )));