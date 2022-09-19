import 'dart:math';
import 'package:flutter/material.dart';

class FingerGuessing extends StatefulWidget {
  const FingerGuessing({super.key});

  @override
  State<FingerGuessing> createState() => _FingerGuessing();
}

class _FingerGuessing extends State<FingerGuessing> {
  //電腦方變數
  int cpuIndex = 1;

  //電腦方隨機函數
  void cpuRandom() {
    setState(() {
      cpuIndex = Random().nextInt(3) + 1;
      // print(cpuIndex);
    });
  }

  //用於獲取點選後的變數
  int tapIndex = 0;

  //電腦方勝場
  int cpuWin = 0;

  //我方勝場
  int youWin = 0;

  //單局勝負變數
  String winText = '';

  //判斷單局勝負函數
  void whoWin() {
    if (tapIndex == 1 && cpuIndex == 3 ||
        tapIndex == 2 && cpuIndex == 1 ||
        tapIndex == 3 && cpuIndex == 2) {
      winText = 'You Win!';
      youWin += 1;
    } else {
      if (tapIndex == 1 && cpuIndex == 1 ||
          tapIndex == 2 && cpuIndex == 2 ||
          tapIndex == 3 && cpuIndex == 3) {
        winText = '平手';
      } else {
        winText = 'CPU Win!';
        cpuWin += 1;
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

  //按鈕文字
  String buttonText = '對決';

  //重置所有變數
  void resetAllData() {
    cpuWin = 0;
    youWin = 0;
    tapIndex = 0;
    sentence = '';
    winText = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //電腦方文字
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: const Text(
              'CPU',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
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
                    return Image.asset('assets/images/red$index.png',
                        fit: BoxFit.contain);
                  },
                );
              },
            ),
          ),
          //中間對決處
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
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
                          'assets/images/red$cpuIndex.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          'CPU',
                          style: TextStyle(fontSize: 20, color: Colors.red),
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
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: tapIndex != 0
                            ? Image.asset(
                                'assets/images/blue$tapIndex.png',
                                fit: BoxFit.contain,
                              )
                            : Image.asset(
                                'assets/images/blue1.png',
                                fit: BoxFit.contain,
                              ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          'YOU',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
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
              height: MediaQuery.of(context).size.height / 10,
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
            '你的選擇',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
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
                                'assets/images/blue$index.png',
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
          //點擊後可開始對決，當輸贏文字不為空的時候，按鈕顯示文字為重新開始且按下時將各變數重置
          //否則執行if的內容，如果點選後的變數不為0，按鈕文字就顯示為對決，否則顯示為請選擇
          sentence != ''
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      resetAllData();
                    });
                  },
                  child: const Text('重新開始'),
                )
              : ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (tapIndex != 0) {
                        buttonText = '對決';
                        cpuRandom();
                        whoWin();
                        winGame();
                      } else {
                        buttonText = '請選擇';
                      }
                    });
                  },
                  child: Text(buttonText)),
        ],
      ),
    );
  }
}
