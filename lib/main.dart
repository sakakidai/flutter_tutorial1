import 'package:flutter/material.dart';
import 'package:flutter_tutorial1/test_page1.dart';
import 'package:flutter_tutorial1/test_page2.dart';
import 'package:flutter_tutorial1/test_page3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Flutter Demo Home Page"),
      routes: {
        '/test1': (BuildContext context) => const TestPage1(),
        '/test2': (BuildContext context) => const TestPage2(),
        '/test3': (BuildContext context) => const TestPage3(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: TestPage1());
  }
}
