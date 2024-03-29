import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent/bloc/habits_bloc.dart';
import 'package:intent/intent_theme.dart';
import 'package:intent/repositories/habits/dummy_habit_repo.dart';
import 'package:intent/repositories/habits/firestore_habit_repo.dart';
import 'package:intent/repositories/habits/firestore_collection.dart';
import 'package:intent/repositories/habits/habit_repository.dart';
import 'package:intent/views/widgets/add_item_dialog.dart';
import 'package:intent/views/widgets/habit_list.dart';
import 'package:intent/views/widgets/error_message.dart';
import 'package:intent/views/widgets/loading_spinner.dart';

import 'constants.dart';

void main() {
  final HabitRepository dummyHabitRepo = DummyHabitRepo();
  final HabitRepository firebaseHabitRepo = FirestoreHabitRepo(FirestoreCollection('habits'));

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<HabitsBloc>(
          create: (context) {
            return HabitsBloc(
                habitRepository:
                    releaseMode ? firebaseHabitRepo : dummyHabitRepo)
              ..add(HabitsLoadRequested());
          },
        ),
      ],
      child: MaterialApp(
        title: 'Intent',
        theme: IntentTheme.darkTheme,
        home: IntentApp(),
      )));
}

class IntentApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: releaseMode
          ? FutureBuilder(
              future: Firebase.initializeApp(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return displayErrorMessage();
                if (snapshot.connectionState != ConnectionState.done)
                  return displayLoadingSpinner();
                return HabitsList();
              })
          : HabitsList(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Open the add habit dialog
            showDialog(
              context: context,
              builder: (context) => AddItemDialog("Let's start a new habit!"),
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
