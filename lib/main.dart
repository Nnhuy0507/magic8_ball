import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const Magic8BallApp());
}


class Magic8BallApp extends StatelessWidget {
  const Magic8BallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magic 8 Ball',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),

      home: const Magic8BallPage(),
    );
  }
}


class Magic8BallPage extends StatefulWidget {
  const Magic8BallPage({super.key});

  @override
  State<Magic8BallPage> createState() => _Magic8BallPageState();
}

class _Magic8BallPageState extends State<Magic8BallPage> {


  final Random random = Random();


  int ballNumber = 1;

  final List<String> answers = [
    'Chắc chắn!',
    'Có thể!',
    'Không chắc chắn.',
    'Hãy thử lại.',
    'Câu trả lời là có.',
  ];

  String answer = 'Hãy hỏi tôi...';

  void askMagic8Ball() {
    setState(() {

      ballNumber = random.nextInt(5) + 1;

      answer = answers[random.nextInt(answers.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: const Text(
          'Magic 8 Ball',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Image.asset(
              'assets/ball$ballNumber.png',
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),

            // Khoảng cách
            const SizedBox(
              height: 30,
            ),

            Text(
              answer,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),


            const SizedBox(
              height: 30,
            ),


            ElevatedButton(
              onPressed: askMagic8Ball,

              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),

              child: const Text(
                'HỎI MAGIC 8',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}