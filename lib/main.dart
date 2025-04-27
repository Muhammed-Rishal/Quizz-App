import 'package:flutter/material.dart';
import 'package:quizz_app/welcomeScreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
          labelLarge: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white), // keep it too if needed
        ),
        appBarTheme:AppBarTheme(
            elevation: 0,
            centerTitle: true,
          color: Colors.blue,

        ),


      ),

    );
  }
}
