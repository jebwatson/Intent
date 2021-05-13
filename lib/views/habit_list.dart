import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent/bloc/habits_bloc_bloc.dart';
import 'package:intent/views/widgets/error_message.dart';

import 'habit_card.dart';

class HabitsList extends StatefulWidget {
  final Map<Type, Function> mapStateToWidget = HashMap();

  HabitsList({Key? key}) : super(key: key) {
    mapStateToWidget.addAll({
      HabitsLoading: _displayLoading,
      HabitsLoaded: _displayHabits,
      HabitsError: _displayError,
    });
  }

  Widget _displayLoading(HabitsBlocState state) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _displayHabits(HabitsBlocState state) {
    final habits = (state as HabitsLoaded).habits;
    return ListView.builder(
      itemBuilder: (context, index) {
        return HabitCard(habit: habits[index]);
      },
      itemCount: habits.length,
    );
  }

  Widget _displayError(HabitsBlocState state) {
    return displayErrorMessage();
  }

  @override
  _HabitsListState createState() => _HabitsListState();
}

class _HabitsListState extends State<HabitsList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocBuilder<HabitsBlocBloc, HabitsBlocState>(
        builder: (context, state) {
          return widget.mapStateToWidget[state.runtimeType]?.call(state) ??
              displayErrorMessage();
        },
      ),
    );
  }
}
