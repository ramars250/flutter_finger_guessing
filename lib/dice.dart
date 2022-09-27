import 'dart:math';
import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> with SingleTickerProviderStateMixin {
  //電腦方變數
  int cpuLeftDice = 0;
  int cpuRightDice = 0;

  //電腦方總點數變數
  int cpuPoint = 0;

  //電腦方隨機函數
  void cpuGetNumber() {
    setState(() {
      cpuLeftDice = Random().nextInt(6) + 1;
      cpuRightDice = Random().nextInt(6) + 1;
      cpuPoint = cpuLeftDice + cpuRightDice;
    });
  }

  //我方變數
  int leftDice = 0;
  int rightDice = 0;

  //我方總點數變數
  int youPoint = 0;

  //我方隨機函數
  void youGetNumber() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
      youPoint = leftDice + rightDice;
    });
  }

  //單局勝負變數
  String winText = '';

  //電腦方勝場
  int cpuWin = 0;

  //我方勝場
  int youWin = 0;

  //判斷單局勝負
  void whoWin() {
    if (cpuPoint > youPoint) {
      winText = 'CPU Win!';
      cpuWin += 1;
    } else {
      if (cpuPoint == youPoint) {
        winText = '平手';
      } else {
        winText = 'You Win!';
        youWin += 1;
      }
    }
  }

  //輸贏文字
  String sentence = '';

  //判斷總勝負函數
  void winGame() {
    if (cpuWin == 3) {
      sentence = '你輸了！哈！哈！哈！';
    } else {
      if (youWin == 3) {
        sentence = '是我贏了！';
      }
    }
  }

  //重置所有變數
  void resetAllData() {
    cpuWin = 0;
    youWin = 0;
    sentence = '';
    winText = '';
  }

  //動畫試作
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 12),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('骰子遊戲'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.red.shade300,
        child: Column(
          children: [
            //電腦方文字
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10.0),
              child: const Text(
                'CPU',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            //電腦方圖片
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                  child: Row(
                    children: [
                      Expanded(
                        child: cpuLeftDice == 0
                            ? Image.asset(
                                'assets/images/dice${Random().nextInt(6) + 1 * _controller.value ~/ 1 + 1}.png',
                              )
                            : Image.asset(
                                'assets/images/dice$cpuLeftDice.png',
                              ),
                      ),
                      Expanded(
                        child: cpuRightDice == 0
                            ? Image.asset(
                                'assets/images/dice${Random().nextInt(6) + 1 * _controller.value ~/ 1 + 1}.png',
                              )
                            : Image.asset(
                                'assets/images/dice$cpuRightDice.png',
                              ),
                      ),
                    ],
                  ),
                );
              },
            ),
            //中間對決處
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            '總點數為$cpuPoint點',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'CPU',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'WIN: $cpuWin',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'VS',
                        style: TextStyle(fontSize: 30),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          winText,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            '總點數為$youPoint點',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'YOU',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'WIN: $youWin',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //顯示結果處
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  sentence,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            //我方文字
            const Text(
              '你的骰子',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            //我方圖片
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                  child: Row(
                    children: [
                      Expanded(
                        child: leftDice == 0
                            ? Image.asset(
                                'assets/images/dice${Random().nextInt(6) + 1 * _controller.value ~/ 1 + 1}.png',
                              )
                            : Image.asset(
                                'assets/images/dice$leftDice.png',
                              ),
                      ),
                      Expanded(
                        child: rightDice == 0
                            ? Image.asset(
                                'assets/images/dice${Random().nextInt(6) + 1 * _controller.value ~/ 1 + 1}.png',
                              )
                            : Image.asset(
                                'assets/images/dice$rightDice.png',
                              ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: sentence != ''
                  ? ElevatedButton(
                      onPressed: () {
                        setState(() {
                          resetAllData();
                        });
                      },
                      child: const Text('重新開始'),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          cpuGetNumber();
                          youGetNumber();
                          whoWin();
                          winGame();
                        });
                        await Future.delayed(
                          const Duration(
                            seconds: 4,
                          ),
                        );
                        cpuLeftDice = 0;
                        cpuRightDice = 0;
                        leftDice = 0;
                        rightDice = 0;
                      },
                      child: const Text('請擲骰!')),
            ),
          ],
        ),
      ),
    );
  }
}

diceDirections(BuildContext context) {
  // Init
  AlertDialog dialog = AlertDialog(
    title: const Text('骰子遊戲說明'),
    actions: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/03.jpg',
              fit: BoxFit.contain,
            ),
            Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  '於此處按下請擲骰',
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
      ElevatedButton(
          child: const Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          }),
    ],
  );

  // Show the dialog
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      });
}
