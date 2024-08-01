import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/home_screen.dart';

void main() => runApp(const MyWidget());

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffE7626C),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xff232B55),
          ),
        ),
        cardColor: const Color(0xffF4EDDB),
      ),
      home: const HomeScreen(),
    );
  }
}
