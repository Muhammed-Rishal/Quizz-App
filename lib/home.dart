import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Question {
  final String text;
  final List<String> options;
  final String answer;
  Question(
      {required this.text, required this.options, required this.answer});
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Question> questions = [
    Question(
      text: 'What is Flutter primarily used for?',
      options: [
        'Backend development',
        'Cross-platform mobile app development',
        'Database management',
        'Game development',
      ],
      answer: 'Cross-platform mobile app development',
    ),
    Question(
      text: 'Which programming language does Flutter use?',
      options: ['Java', 'Python', 'Dart', 'Kotlin'],
      answer: 'Dart',
    ),
    Question(
      text: 'What widget is used for a scrollable list in Flutter?',
      options: ['Column', 'Stack', 'Container', 'List View'],
      answer: 'List View',
    ),
    Question(
      text: 'What command compiles a Flutter app for release?',
      options: [
        'Flutter run',
        'Flutter debug',
        'Flutter build apk',
        'Flutter test',
      ],
      answer: 'Flutter build apk',
    ),
    Question(
      text: 'Which widget is the root of a Flutter app?',
      options: [
        'MaterialApp or CupertinoApp',
        'Container',
        'AppBar',
        'Scaffold',
      ],
      answer: 'MaterialApp or CupertinoApp',
    ),
    Question(
      text: 'How do you add dependencies in Flutter?',
      options: [
        'In android/build.gradle',
        'In pubspec.yaml',
        'In main.dart',
        'In index.html',
      ],
      answer: 'In pubspec.yaml',
    ),
    Question(
      text: 'What is setState() used for?',
      options: [
        'To navigate between screens',
        'To update the UI after changing state',
        'To make HTTP requests',
        'To define styles',
      ],
      answer: 'To update the UI after changing state',
    ),
    Question(
      text: 'Which package is used for HTTP requests in Flutter?',
      options: ['flutter_http', 'dart:io', 'http', 'dio'],
      answer: 'http',
    ),
    Question(
      text: 'What is the purpose of BuildContext?',
      options: [
        'To store app data',
        'To locate widgets in the tree',
        'To handle gestures',
        'To manage routes',
      ],
      answer: 'To locate widgets in the tree',
    ),
    Question(
      text: 'What does Hot Reload do in Flutter?',
      options: [
        'Restarts the app from scratch',
        'Updates the UI instantly without losing state',
        'Clears all app data',
        'Deletes unused code',
      ],
      answer: 'Updates the UI instantly without losing state',
    ),
  ];

  int currentIndex = 0;
  int score = 0;
  bool answered = false;
  Timer? _timer;
  int _timeLeft = 10;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer?.cancel();
    _timeLeft = 10;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          answered = true;
          _timer?.cancel();
        }
      });
    });
  }

  void checkAnswer(String selected) {
    if (!answered) {
      setState(() {
        answered = true;
        if (selected == questions[currentIndex].answer) {
          score++;
        }
        _timer?.cancel();
      });
    }
  }

  void nextQuestion() {
    setState(() {
      currentIndex++;
      answered = false;
      _timeLeft = 10;
    });
    startTimer();
  }

  void navigateToResult() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          score: score,
          totalQuestions: questions.length,
          onRestart: () {
            Navigator.pop(context);
            setState(() {
              currentIndex = 0;
              score = 0;
              answered = false;
              _timeLeft = 10;
            });
            startTimer();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex >= questions.length) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz Completed!',
                style: GoogleFonts.bubblegumSans(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Your Score: $score/${questions.length}',
                style: GoogleFonts.bubblegumSans(fontSize: 24),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                    score = 0;
                    answered = false;
                    _timeLeft = 10;
                  });
                  startTimer();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: Text('Restart Quiz', style: GoogleFonts.bubblegumSans()),
              ),
            ],
          ),
        ),
      );
    }

    final current = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            'Quizzz...',
            style: GoogleFonts.bubblegumSans(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: (currentIndex + 1) / questions.length,
                minHeight: 5,
                backgroundColor: Colors.blue,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              Center(
                child: Image.asset('Assets/brain.png', width: 200, height: 200),
              ),
              const SizedBox(height: 5),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Question ${currentIndex + 1}/${questions.length}',
                        style: GoogleFonts.bubblegumSans(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        current.text,
                        style: GoogleFonts.bubblegumSans(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Time Left: $_timeLeft seconds',
                        style: GoogleFonts.bubblegumSans(
                          fontSize: 18,
                          color: _timeLeft > 7
                              ? Colors.green
                              : _timeLeft > 4
                              ? Colors.orange
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: current.options.length,
                  itemBuilder: (context, index) {
                    final option = current.options[index];
                    final isCorrect = option == current.answer;
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: answered
                              ? (isCorrect ? Colors.green : Colors.grey[300])
                              : Colors.deepPurple,
                          foregroundColor: answered && !isCorrect
                              ? Colors.black
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => checkAnswer(option),
                        child: Text(
                          option,
                          style: GoogleFonts.bubblegumSans(fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (answered)
                Center(
                  child: ElevatedButton(
                    onPressed: currentIndex < questions.length - 1
                        ? nextQuestion
                        : navigateToResult,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white
                    ),
                    child: Text(
                      currentIndex < questions.length - 1
                          ? 'Next Question'
                          : 'See Results',
                      style: GoogleFonts.bubblegumSans(fontSize: 18),

                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}