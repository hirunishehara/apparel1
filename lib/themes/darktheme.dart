import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ThemeData darkTheme = ThemeData(
brightness: Brightness.dark,
appBarTheme: const AppBarTheme(
backgroundColor: Colors.black,
elevation: 0,
),
colorScheme: ColorScheme.dark(
background: Colors.black,
primary: Colors.grey[900]!,));