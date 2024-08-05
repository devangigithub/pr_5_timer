import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DateTime dateTime = DateTime.now();
  int hour = 0,
      minute = 0,
      second = 0;
  String day = '';

  void start() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      hour = DateTime
          .now()
          .hour;
      minute = DateTime
          .now()
          .minute;
      second = DateTime
          .now()
          .second;

      if (hour >= 12) {
        hour -= 12;
        day = "PM";
      } else {
        day = "AM";
      }

      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    hour = dateTime.hour;
    minute = dateTime.minute;
    second = dateTime.second;
    start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'Clock',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      drawer: Drawer(
        backgroundColor: Colors.pink.withOpacity(0.2),
        child: Column(
          children: [

            const DrawerHeader (child: CircleAvatar(radius: 80,),),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(
                            text: "User Name : ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: "Devangi S Suvariya",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ]
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            TextButton(child:  const Text  ("Stop Watch", style: TextStyle(
                color: Colors.white
            ),),
                onPressed: () {
              Navigator.of(context).pushNamed("stopwatch");
            }),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("timer");
            }, child:  const Text("Timer", style: TextStyle(
                color: Colors.white
            ),)),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '${hour}  :',
                    style: const TextStyle(fontSize: 27, color: Colors.pink),
                  ),
                ),
                Center(
                  child: Text(
                    '  ${minute}  :',
                    style: const TextStyle(fontSize: 27, color: Colors.pink),
                  ),
                ),
                Center(
                  child: Text(
                    '  ${second}',
                    style: const TextStyle(fontSize: 27, color: Colors.pink),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    '${day}',
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),


          Expanded(
            child: Stack(
                alignment: Alignment.center,
                children: [
                  // second hand
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.5),
                            spreadRadius: 7,
                            blurRadius: 17,
                            offset: const Offset(0, 0),
                          )
                        ],
                      ),
                      child: Transform.rotate(
                        angle: (2 * pi) * (second / 60) + (pi / 2),
                        child: Divider(
                          thickness: 2,
                          indent: 0,
                          endIndent: 100,
                          color: Colors.pink.shade700,
                        ),
                      ),

                    ),
                  ),

                  Expanded(
                    child: Transform.scale(
                      scale: 5,
                      child: CircularProgressIndicator(
                        value: second / 60,
                        color: Colors.pink.shade700,
                      ),
                    ),
                  ),

                  // minute hand
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Transform.rotate(
                        angle: (2 * pi) * (minute / 60) + (pi / 2),
                        child: Divider(
                          thickness: 2,
                          indent: 20,
                          endIndent: 100,
                          color: Colors.pink.shade900,
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Transform.scale(
                      scale: 4,
                      child: CircularProgressIndicator(
                        value: minute / 60,
                        color: Colors.pink.shade900,
                      ),
                    ),
                  ),


                  //   hour hand
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Transform.rotate(
                        angle: (2 * pi) * (hour / 12) + (pi / 2),
                        child: const Divider(
                          thickness: 2,
                          indent: 36,
                          endIndent: 100,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Transform.scale(
                      scale: 3.2,
                      child: CircularProgressIndicator(
                        value: hour / 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
                ),
          ),
    ],
    ),
    );
  }
}
