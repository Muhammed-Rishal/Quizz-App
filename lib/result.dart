import 'package:flutter/material.dart';
import 'home.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final VoidCallback onRestart;

  const ResultPage({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Score: $score/$totalQuestions',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Restart Quiz'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}