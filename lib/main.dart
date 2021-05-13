import 'package:flutter/material.dart';
import 'package:intent/repositories/habits/habit_repository.dart';
import 'package:intent/repositories/habits/dummy_habit_repo.dart';
import 'package:intent/views/habit_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<HabitRepository>(create: (_) => DummyHabitRepo()),
  ], child: IntentApp()));
}

class IntentApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intent',
      theme: ThemeData.dark(),
      home: HabitsList(habitProvider: context.read<HabitRepository>()),
    );
  }
}
