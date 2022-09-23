import 'dart:math';

import 'package:flutter/material.dart';

class GuessNumber extends StatefulWidget {
  const GuessNumber({Key? key}) : super(key: key);

  @override
  State<GuessNumber> createState() => _GuessNumberState();
}

class _GuessNumberState extends State<GuessNumber> {
  //隨機數變數
  int randomNumber = Random().nextInt(100);

  //輸入值變數
  TextEditingController inputNumber = TextEditingController();

  //獲取輸入值變數
  int guessNumber = 0;

  //左邊的數字變數
  int smallNumber = 0;

  //右邊的數字變數
  int bigNumber = 100;

  //獲取輸入值
  String getInput = '';

  //檢查數字函數
  void checkingNumber() {
    guessNumber = int.parse(getInput);
    setState(() {
      if (guessNumber < randomNumber) {
        smallNumber = guessNumber;
      } else {
        if (guessNumber > randomNumber) {
          bigNumber = guessNumber;
        } else {
          sentence = '猜中了';
        }
      }
    });
  }

  //結束文字
  String sentence = '';

  //焦點變化
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    inputNumber.addListener(() {
      setState(() {
        getInput = inputNumber.text;
      });
    });
  }

  @override
  void dispose() {
    inputNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('終極密碼'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                child: GridView.count(
                  padding: const EdgeInsets.all(10),
                  crossAxisCount: 3,
                  crossAxisSpacing: 30,
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      alignment: Alignment.center,
                      child: Text(
                        '$smallNumber',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      alignment: Alignment.center,
                      child: sentence != ''
                          ? Text(
                              '$randomNumber',
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          : const Text(
                              '?',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      alignment: Alignment.center,
                      child: Text(
                        '$bigNumber',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 5.0),
            height: MediaQuery.of(context).size.height / 12,
            width: MediaQuery.of(context).size.width / 2,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              maxLength: 2,
              controller: inputNumber,
              // autofocus: true,
              focusNode: focusNode,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                hintStyle: TextStyle(fontSize: 20),
                hintText: '請輸入你想猜的數字',
                border: InputBorder.none,
              ),
            ),
          ),
          inputNumber.text != ''
              ? ElevatedButton(
                  onPressed: () {
                    focusNode.unfocus();
                    checkingNumber();
                    inputNumber.text = '';
                  },
                  child: const Text('確定'),
                )
              : ElevatedButton(
                  onPressed: () {},
                  child: const Text('請輸入數字'),
                ),
          Text(
            sentence,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
