import 'package:flutter/material.dart';
import 'package:timer_app/timer-body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Scaffold(
         body: Padding(
           padding: EdgeInsets.symmetric( ),
           child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Timerr()
               ],
             ),
           ),
         ),

       ),
    );
  }
}
