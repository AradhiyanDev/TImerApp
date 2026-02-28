import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int seconds = 0;
  Timer? timer;
  bool isLoading = false;

  @override
  void initState() {
    seconds = 0;
    isLoading = false;
    super.initState();
  }

  void startTimer() {
    if (!isLoading) {
      timer = Timer.periodic(Duration(seconds: 1), (Timer time) {
        setState(() {
          seconds++;
        });
      });
      setState(() {
        isLoading = true;
      });
    }
  }

  void stopTimer() {
    if (isLoading) {
      timer?.cancel();
      setState(() {
        isLoading = false;
      });
    }
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      seconds = 0;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  String fortmatTimer(int seconds) {
    final hours = seconds ~/ 3600;
    final min = (seconds % 3600) ~/ 60;
    final sec = seconds % 60;

    return '${hours.toString()} : ${min.toString()} : ${sec.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.onSecondary,
      appBar: AppBar(title: Text('Timer'), centerTitle: true, backgroundColor: colorScheme.primary,foregroundColor: colorScheme.onPrimary,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
              color: colorScheme.onSurfaceVariant,
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 49,vertical: 20),
                child: Text(fortmatTimer(seconds),
                style: textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSecondary,
                  fontFeatures: [FontFeature.tabularFigures()]
                ),
                ),
              )),
           SizedBox(height: 45,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading
                    ? ElevatedButton.icon(
                        icon: Icon(Icons.pause),
                        onPressed: () {
                          stopTimer();
                        },
                        label: Text('Pause'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.onSecondaryContainer,
                          foregroundColor: colorScheme.onSecondary,
                          textStyle: textTheme.titleSmall
                        )
                      )
                    : ElevatedButton.icon(
                        icon: Icon(Icons.play_arrow),
                        onPressed: () {
                          startTimer();
                        },
                        label: Text('Start'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          textStyle: textTheme.titleSmall
                        )
                      ),
                SizedBox(width: 25,),
                ElevatedButton.icon(
                  icon: Icon(Icons.restore),
                  onPressed: () {
                    resetTimer();
                  },
                  label: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
