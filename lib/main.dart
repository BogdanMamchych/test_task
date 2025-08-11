import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = Random();
  int _r = 255;
  int _g = 255;
  int _b = 255;
  int _positionIndex = 0;

  void _generateBackgroundColor() {
    _r = random.nextInt(256);
    _g = random.nextInt(256);
    _b = random.nextInt(256);
  }

  void _moveText() => _positionIndex = (_positionIndex + 1) % 3;

  Alignment _alignment(int index) {
    switch (index) {
      case 1:
        return Alignment.centerLeft;
      case 2:
        return Alignment.centerRight;
      case 0:
      default:
        return Alignment.center;
    }
  }

  void _actions() {
    setState(() {
      _generateBackgroundColor();
      _moveText();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(_r, _g, _b, 1),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _actions,
        child: Column(
          children: [
            Expanded(
              child: AnimatedAlign(
                alignment: _alignment(_positionIndex),
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Hello there',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
