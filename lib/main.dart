import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent/bloc/habits_bloc_bloc.dart';
import 'package:intent/repositories/habits/firestore_habit_repo.dart';
import 'package:intent/views/habit_list.dart';
import 'package:intent/views/widgets/error_message.dart';
import 'package:intent/views/widgets/loading_spinner.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HabitsBlocBloc>(
      create: (context) {
        return HabitsBlocBloc(habitRepository: FirebaseHabitRepo())
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
      home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return displayErrorMessage();
            if (snapshot.connectionState != ConnectionState.done)
              return displayLoadingSpinner();
            return HabitsList();
          }),
    );
  }
}
