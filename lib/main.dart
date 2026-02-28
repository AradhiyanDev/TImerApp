
import 'package:flutter/material.dart';
import 'package:timer/screens/TimerPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 23, 219, 213),
        ),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 13, 85, 4),
          brightness: Brightness.dark,
        ),
      ),
      home: const TimerPage(),
    );
  }
}
