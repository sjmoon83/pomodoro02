import 'package:flutter/material.dart';
import 'package:pomodoro/screen/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color.fromRGBO(230, 77, 61, 1.0),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color.fromRGBO(255, 255, 255, 1.0),
      ),
      home: const HomeScreen(),
    );
  }
}
