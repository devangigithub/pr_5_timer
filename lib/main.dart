import 'package:flutter/material.dart';
import 'package:lab_work_six_three_ten/screen/stopwatch_screen.dart';
import 'package:lab_work_six_three_ten/screen/home_screen.dart';
import 'package:lab_work_six_three_ten/screen/timer.dart';



void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(contxet){return const HomeScreen();},
          'stopwatch':(contxet){return const StopwatchScreen();},
          'timer':(contxet){return const TimerScreen();},
        },
      )
  );
}



