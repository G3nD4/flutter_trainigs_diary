import 'package:flutter/material.dart';
import 'package:sport_app/home_page.dart';

void main() {
  runApp(const SportApp());
}

class SportApp extends StatefulWidget {
  const SportApp({super.key});

  @override
  State<SportApp> createState() => _SportAppState();
}

class _SportAppState extends State<SportApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
