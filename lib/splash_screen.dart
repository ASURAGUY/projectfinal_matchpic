import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

import 'package:pojectmobile_astronomy/homepage.dart';



class SplashScreen extends StatefulWidget {
  @override
  _TimerButton createState() => _TimerButton();
}

class _TimerButton extends State<SplashScreen> {
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 4;
  int currentSeconds = 0;

  startTimeout([int milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          timer.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/dancing-cute-duck.gif',
                width: 400.0,
                height: 400.0,
              ),
              Text(
                "เกมจับคู่ภาพ",
                style: Theme.of(context).textTheme.headline2, // like <h1> in HTML
              )
            ],
          ),
        ),
      ),
    );
  }
}