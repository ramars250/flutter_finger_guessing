import 'package:flutter/material.dart';

class Ox extends StatefulWidget {
  const Ox({Key? key}) : super(key: key);

  @override
  State<Ox> createState() => _OxState();
}

class _OxState extends State<Ox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('井字遊戲'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              padding: const EdgeInsets.only(right: 10, left: 10),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('重新開始'),
            )
          ],
        ),
      ),
    );
  }
}
