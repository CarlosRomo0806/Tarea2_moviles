import 'package:flutter/material.dart';
import 'package:tip_time/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 105, 190, 111)
          ),
          listTileTheme: ListTileThemeData(
          iconColor: Color.fromARGB(255, 105, 190, 111),
        ),
      ),
      home: const HomePage(),
    );
  }
}
