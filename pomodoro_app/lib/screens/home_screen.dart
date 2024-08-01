import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalPomodoros = 0;
  int totalSeconds = twentyFiveMinutes;
  late Timer timer;
  bool isRunning = false;

  void onTick(Timer timer) {
    if (totalSeconds > 1) {
      setState(() {
        totalSeconds -= 1;
      });
    } else {
      resetTimer();
    }
  }

  void resetTimer() {
    timer.cancel();
    isRunning = false;
    setState(() {
      totalSeconds = twentyFiveMinutes;
      totalPomodoros += 1;
    });
  }

  void onStartPressed() {
    setState(() {
      isRunning = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    final formattedDuration =
        duration.toString().split(".").first.substring(2, 7);
    return formattedDuration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 92,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: IconButton(
                icon: const Icon(Icons.play_circle_outlined),
                iconSize: 92,
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                isSelected: isRunning,
                selectedIcon: const Icon(Icons.pause_circle_outline_outlined),
              ),
            ),
          ),
          Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(45)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Pomodoros",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: const TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
