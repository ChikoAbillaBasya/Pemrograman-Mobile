import 'dart:async';
import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }
}

class NumberStream {
  final StreamController<int> controller = StreamController<int>();
  
  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }
  
  close() {
    controller.close();
  }
}