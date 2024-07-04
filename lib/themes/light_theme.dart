import 'package:dev_essentials/commons/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primaryColor),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: InputBorder.none,
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    outlineBorder: BorderSide.none,
    activeIndicatorBorder: BorderSide.none,
  ),
);
