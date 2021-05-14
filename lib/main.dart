import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent/bloc/habits_bloc.dart';
import 'package:intent/repositories/habits/dummy_habit_repo.dart';
import 'package:intent/repositories/habits/firestore_habit_repo.dart';
import 'package:intent/views/widgets/habit_list.dart';
import 'package:intent/views/widgets/error_message.dart';
import 'package:intent/views/widgets/loading_spinner.dart';
import 'package:flutter/foundation.dart';

bool get releaseMode => kReleaseMode;

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HabitsBloc>(
      create: (context) {
        return HabitsBloc(
            habitRepository:
                releaseMode ? FirebaseHabitRepo() : DummyHabitRepo())
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
      home: showHomeView(),
    );
  }
}

Widget showHomeView() {
  final Widget homeView = Scaffold(
    body: HabitsList(),
    floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open the add habit dialog
        },
        child: const Icon(Icons.add)),
  );

  if (releaseMode) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return displayErrorMessage();
          if (snapshot.connectionState != ConnectionState.done)
            return displayLoadingSpinner();
          return homeView;
        });
  }

  return homeView;
}
