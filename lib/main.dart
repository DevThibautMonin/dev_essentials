import 'package:dev_essentials/presentation/content_screen.dart';
import 'package:dev_essentials/themes/dark_theme.dart';
import 'package:dev_essentials/themes/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevEssentials',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const Scaffold(
        body: SafeArea(
          child: ContentScreen(),
        ),
      ),
    );
  }
}
