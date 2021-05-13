import 'package:flutter/material.dart';
import 'package:intent/providers/DummyHabitProvider.dart';
import 'package:intent/providers/HabitProvider.dart';
import 'package:intent/views/HabitList.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<HabitProvider>(create: (_) => DummyHabitProvider()),
  ], child: IntentApp()));
}

class IntentApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intent',
      theme: ThemeData.dark(),
      home: HabitsList(habitProvider: context.read<HabitProvider>()),
    );
  }
}
