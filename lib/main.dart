import 'package:flutter/material.dart';
import 'package:intent/providers/DummyHabitProvider.dart';
import 'package:intent/providers/HabitProvider.dart';
import 'package:intent/views/HabitList.dart';

void main() {
  runApp(IntentApp());
}

class IntentApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final HabitProvider _habitProvider = DummyHabitProvider();

    return MaterialApp(
      title: 'Intent',
      theme: ThemeData.dark(),
      home: HabitsList(habitProvider: _habitProvider),
    );
  }
}
