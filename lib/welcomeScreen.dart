import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/home.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: 6.2, // Slight rotation (~11.5 degrees)
              child: Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Center(
                  child: Text(
                    'Quizz...',
                    style: GoogleFonts.bubblegumSans(
                      color: Colors.blue[900],
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40), // Spacer
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()),);
              },
              child: const Text('Start', style: TextStyle(color: Colors.blue,fontSize: 24,shadows: [Shadow(
                color: Colors.grey,
                offset: Offset(2, 0),
                blurRadius: 0,
              )])),


              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
