import 'package:flutter/material.dart';

class GuessNumber extends StatefulWidget {
  const GuessNumber({Key? key}) : super(key: key);

  @override
  State<GuessNumber> createState() => _GuessNumberState();
}

class _GuessNumberState extends State<GuessNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '0~~~~~~',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '?~~~~~~',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '100',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
