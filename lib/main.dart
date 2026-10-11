import 'package:flutter/material.dart';
import 'todo/pages/home_page.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Day',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A7C59),
          brightness: Brightness.light,
        ),
        fontFamily: 'SF Pro Display',
        useMaterial3: true,
      ),
      home: const TodoHomePage(),
    );
  }
}
