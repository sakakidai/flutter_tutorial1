import 'package:flutter/material.dart';

class TestPage2 extends StatelessWidget {
  const TestPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => {
                Navigator.of(context).pushNamed('/test3')
                // Navigator.of(context).push(MaterialPageRoute(builder: (content) {
                //   return const TestPage3();
                // }))
              },
              child: const Text('進む', style: TextStyle(fontSize: 80)),
            ),
            TextButton(
              onPressed: () => {Navigator.of(context).pop()},
              child: const Text('戻る', style: TextStyle(fontSize: 80)),
            ),
          ],
        ),
      ),
    );
  }
}
