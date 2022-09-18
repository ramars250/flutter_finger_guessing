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
  //電腦方變數
  int cpuIndex = 1;

  //用於獲取點選後的變數
  int tapIndex = 0;

  //電腦方隨機函數
  void cpuRandom() {
    setState(() {
      cpuIndex = Random().nextInt(3) + 1;
      // print(cpuIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //電腦方文字
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: const Text('CPU'),
        ),
        //電腦方圖片
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
        //中間對決處
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/images/blue$cpuIndex.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Text(
                      'CPU',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                child: const Text(
                  'VS',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: tapIndex != 0
                          ? Image.asset(
                              'assets/images/red$tapIndex.png',
                              fit: BoxFit.contain,
                            )
                          : Image.asset(
                              'assets/images/red1.png',
                              fit: BoxFit.contain,
                            ),
                    ),
                    const Text(
                      'YOU',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //我方文字
        const Text('你的選擇'),
        //我方圖片
        Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          //用StatefulBuilder是為了下方點選後可以正常變更顏色
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
                  //可點選
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
                    ),
                  );
                },
              );
            },
          ),
        ),
        //點擊後可開始對決
        ElevatedButton(
          onPressed: () {
            cpuRandom();
            // print(tapIndex);
          },
          child: const Text('Test'),
        ),
      ],
    );
  }
}
