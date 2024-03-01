import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Timerr extends StatefulWidget {
  const Timerr({super.key});

  @override
  State<Timerr> createState() => _TimerState();
}

class _TimerState extends State<Timerr> {
  double percent = 0;
  int time_minute = 2;

  _startTimer() {
    time_minute = 2;
    int k = 1;
    double secPercent = k/time_minute;
    Timer timer = Timer.periodic(Duration(seconds: 60), (timer) {
      setState(() {
        if(time_minute>0){
          time_minute--;
          percent += secPercent;
        }


        else {
          percent = 0;
          time_minute = 2;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Timer Per Minute",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
        SizedBox(height: MediaQuery.of(context).size.height*0.03,),

        CircularPercentIndicator(
          radius: 120,
          percent: percent,
          lineWidth: 9,
          circularStrokeCap: CircularStrokeCap.round,
          animation: true,
          progressColor: Colors.blue,
          center: Text(
            "$time_minute",
            style: GoogleFonts.rubik(fontSize: 32, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
        ElevatedButton(
          onPressed: () {
            _startTimer();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
          ),
          child: Text(
            "Start!",
            style: GoogleFonts.rubik(fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
