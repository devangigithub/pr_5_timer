import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {

  int hour = 00, minute = 00, second = 00;

  Timer? timer;

  @override
  void initState() {
    super.initState();
  }


  void startStopwatch() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        second++;
        if (second >= 60) {
          second = 0;
          minute++;
        }
        if (minute >= 60) {
          minute = 0;
          hour++;
        }
      });
    });
  }

  void stopStopwatch() {
    timer?.cancel();
  }

  void resetStopwatch() {
    timer?.cancel();
    setState(() {
      hour = 0;
      minute = 0;
      second = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'Stop Watch',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Expanded(
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          width: 1,
                          color: Colors.pink,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(10),),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 12,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text.rich(

                        TextSpan(
                          children: [
                            TextSpan(
                              text: "    ${hour.toString()}    :",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: "    ${minute.toString()}    :",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: "    ${second.toString()}    ",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(padding:EdgeInsets.only(top: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: startStopwatch,
                      child: const Text("Start",style: TextStyle(
                        color: Colors.pink,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: stopStopwatch,
                      child: const Text("Stop",style: TextStyle(
                        color: Colors.pink,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: resetStopwatch,
                      child: const Text("Reset",style: TextStyle(
                        color: Colors.pink,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}