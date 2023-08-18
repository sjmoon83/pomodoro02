import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectMinute = 1800;
  late int totalSeconds = selectMinute;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(
        () {
          totalPomodoros = totalPomodoros + 1;
          isRunning = false;
          totalSeconds = selectMinute;
        },
      );
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onStopPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = selectMinute;
      totalPomodoros = 0;
    });
  }

  void selectTwenty() {
    totalSeconds = 1200;
    setState(() {});
  }

  void selectTwentyFive() {
    totalSeconds = 1500;
    setState(() {});
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Text(
                      'POMOTIMER',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    format(totalSeconds),
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 89,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.white, width: 2.0),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: selectTwenty,
                      child: Text(
                        '20',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    TextButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: selectTwentyFive,
                      child: Text(
                        '25',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: isRunning
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: IconButton(
                              iconSize: 120,
                              color: Theme.of(context).cardColor,
                              onPressed:
                                  isRunning ? onPausePressed : onStartPressed,
                              icon: Icon(
                                isRunning
                                    ? Icons.pause_circle_outline
                                    : Icons.pause_circle_outline,
                              ),
                            ),
                          ),
                          Center(
                            child: IconButton(
                              iconSize: 120,
                              color: Theme.of(context).cardColor,
                              onPressed: onStopPressed,
                              icon: Icon(
                                isRunning
                                    ? Icons.stop_circle_outlined
                                    : Icons.stop_circle_outlined,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: IconButton(
                          iconSize: 120,
                          color: Theme.of(context).cardColor,
                          onPressed:
                              isRunning ? onPausePressed : onStartPressed,
                          icon: Icon(
                            isRunning
                                ? Icons.pause_circle_outline
                                : Icons.play_circle_outline,
                          ),
                        ),
                      ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '$totalPomodoros',
                                style: TextStyle(
                                  fontSize: 58,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).cardColor,
                                ),
                              ),
                              Text(
                                '/',
                                style: TextStyle(
                                  fontSize: 58,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).cardColor,
                                ),
                              ),
                              Text(
                                '$totalPomodoros',
                                style: TextStyle(
                                  fontSize: 58,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).cardColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'ROUND',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
