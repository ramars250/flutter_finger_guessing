import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('猜拳遊戲'),
        centerTitle: true,
      ),
      body: const FingerGuessing(),
    ),
  ));
}

class FingerGuessing extends StatefulWidget {
  const FingerGuessing({super.key});

  @override
  State<FingerGuessing> createState() => _FingerGuessing();
}

class _FingerGuessing extends State<FingerGuessing> {
  int cpuIndex = Random().nextInt(3) + 1;

  void cpuRandom() {
    setState(() {
      cpuIndex = Random().nextInt(3) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    int tapIndex = 0;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: const Text('CPU'),
        ),
        Container(
          // color: Colors.green,
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          child: StatefulBuilder(
            builder: (context, setState) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                ),
                itemCount: 3,
                itemBuilder: (context, i) {
                  int index = i + 1;
                  return Image.asset('assets/images/blue$index.png',
                        fit: BoxFit.contain);
                },
              );
            },
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: const Text(
                  'CPU',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                child: const Text(
                  'VS',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                child: const Text(
                  'YOU',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        // Container(
        //   child: const
          const Text('你的選擇'),
        // ),
        Container(
          // color: Colors.green,
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          child: StatefulBuilder(
            builder: (context, setState) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                ),
                itemCount: 3,
                itemBuilder: (context, i) {
                  int index = i + 1;
                  bool tapped = index == tapIndex;
                  return InkWell(
                      onTap: () {
                        setState(() {
                          tapIndex = index;
                        });
                      },
                      child: Container(
                        child: tapped
                            ? Image.asset(
                                'assets/images/red$index.png',
                                fit: BoxFit.contain,
                              )
                            : Image.asset(
                                'assets/images/$index.jpg',
                                fit: BoxFit.contain,
                              ),
                      ));
                },
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            cpuRandom();
          },
          child: const Text('Test'),
        ),
      ],
    );
  }
}
