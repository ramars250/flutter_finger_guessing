import 'package:flutter/material.dart';
import 'package:flutter_finger_guessing/finger_guessing.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('遊戲大全'),
        centerTitle: true,
      ),
      body: const FingerGuessing(),
    ),
  ));
}

