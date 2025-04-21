import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text('Quizzz...',style: GoogleFonts.bubblegumSans(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    );
  }
}
