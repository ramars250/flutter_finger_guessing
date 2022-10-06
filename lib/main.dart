import 'package:flutter/material.dart';
import 'package:flutter_finger_guessing/dice.dart';
import 'package:flutter_finger_guessing/finger_guessing.dart';
import 'package:flutter_finger_guessing/guess_number.dart';
import 'package:flutter_finger_guessing/ox.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const FirstIndex(),
        '/page1': (context) => const FingerGuessing(),
        '/page2': (context) => const GuessNumber(),
        '/page3': (context) => const Dice(),
        '/page4': (context) => const Ox(),
      },
    );
  }
}

class FirstIndex extends StatelessWidget {
  const FirstIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('遊戲大全'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: const Text(
                '猜拳遊戲',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/page1');
                fingerDirections(context);
              },
            ),
          ),
          ElevatedButton(
            child: const Text(
              '終極密碼',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/page2');
              guessDirections(context);
            },
          ),
          ElevatedButton(
            child: const Text(
              '骰子遊戲',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/page3');
              diceDirections(context);
            },
          ),
          ElevatedButton(
            child: const Text(
              '井字遊戲',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/page4');

            },
          ),
        ],
      ),
    );
  }
}
