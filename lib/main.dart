import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent/bloc/habits_bloc_bloc.dart';
import 'package:intent/repositories/habits/dummy_habit_repo.dart';
import 'package:intent/views/habit_list.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HabitsBlocBloc>(
      create: (context) {
        return HabitsBlocBloc(habitRepository: DummyHabitRepo())
          ..add(HabitsLoadRequested());
      },
    ),
  ], child: IntentApp()));
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
