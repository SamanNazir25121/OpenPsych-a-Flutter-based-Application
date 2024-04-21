// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

import 'exercise_ArmSwing.dart';
import 'exercise_KneeStretch.dart';
import 'exercise_ToeTouch.dart';
import 'exercise_breath.dart';
import 'exercise_meditation.dart';
import 'exercise_running.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OPEN PSYCH'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 14, 111, 190), Color.fromARGB(255, 136, 185, 138)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Running()));
                  },
                  child: Text('Running', style: TextStyle(fontSize: 18,),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60), // Increase the width of the button
                    padding: EdgeInsets.symmetric(horizontal: 16), // Add padding within the button
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Breath()));
                  },
                  child: Text('Deep Breath', style: TextStyle(fontSize: 18,),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    
                  ),
                ),
                SizedBox(height: 16.0),
               ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ArmSwing()));
                  },
                  child: Text('Arm Swing', style: TextStyle(fontSize: 18,),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: 16.0),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Meditation()));
                  },
                  child: Text('Meditation', style: TextStyle(fontSize: 18,),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: 16.0),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ToeTouch()));
                  },
                  child: Text('Toe Touch', style: TextStyle(fontSize: 18,),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: 16.0),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => KneeStretch()));
                  },
                  child: Text('Knee Stretch', style: TextStyle(fontSize: 18,),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: 16.0),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

