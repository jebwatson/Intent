import 'package:flutter/material.dart';
import 'package:intent/views/HabitList.dart';

void main() {
  runApp(IntentApp());
}

class IntentApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intent',
      theme: ThemeData.dark(),
      home: HabitsList(),
    );
  }
}
