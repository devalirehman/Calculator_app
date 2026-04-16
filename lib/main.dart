import 'package:digital_calculator/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ThemeData theme = AppTheme.dark;

  void toggleTheme() {
    setState(() {
      theme = theme.brightness == Brightness.dark
          ? AppTheme.light
          : AppTheme.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: theme,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOut,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const HomeScreen(),
      ),
    );
  }
}