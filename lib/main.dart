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
  // Random number generator for color components
  final Random _random = Random();
  // red color component
  int _red = 255;
  // green color component
  int _green = 255;
  // blue color component
  int _blue = 255;
  // index to track text position
  int _positionIndex = 0;

  // Generate a random background color
  void _generateBackgroundColor() {
    _red = _random.nextInt(256);
    _green = _random.nextInt(256);
    _blue = _random.nextInt(256);
  }

  // Move the text to the next position
  void _moveText() => _positionIndex = (_positionIndex + 1) % 3;

  // List of alignments for the text
  static const List<Alignment> _alignments = [
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
  ];

  // Handle tap actions to change background color and text position
  void _actions() {
    setState(() {
      _generateBackgroundColor();
      _moveText();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(_red, _green, _blue, 1),
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
                alignment: _alignments[_positionIndex],
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
