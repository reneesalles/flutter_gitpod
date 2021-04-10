import 'package:flutter/material.dart';

class Controller {
  var counter = ValueNotifier<int>(0);

  void incrementCounter() {
    counter.value++;
  }
}
