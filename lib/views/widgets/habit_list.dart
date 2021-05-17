import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent/bloc/habits_bloc.dart';
import 'package:intent/constants.dart';
import 'package:intent/models/habit.dart';
import 'package:intent/views/widgets/error_message.dart';
import 'package:intent/views/widgets/loading_spinner.dart';

import 'habit_card.dart';

class HabitsList extends StatefulWidget {
  //int lastHabitCount = 0;

  HabitsList({Key? key}) : super(key: key);

  @override
  _HabitsListState createState() => _HabitsListState();
}

class _HabitsListState extends State<HabitsList> {
  final Map<Type, Function> mapStateToWidget = HashMap();

  _HabitsListState() {
    mapStateToWidget.addAll({
      HabitsLoading: _displayLoading,
      HabitsLoaded: _displayHabits,
      HabitsError: _displayError,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        padding: EdgeInsets.all(LayoutValues.defaultPadding),
        child: BlocBuilder<HabitsBloc, HabitsState>(
          builder: (context, state) {
            return mapStateToWidget[state.runtimeType]?.call(state) ??
                displayErrorMessage();
          },
        ),
      ),
    );
  }

  Widget _displayLoading(HabitsState state) {
    return displayLoadingSpinner();
  }

  Widget _displayHabits(HabitsState state) {
    final habits = (state as HabitsLoaded).habits;

    /*
    if (habits.length != widget.lastHabitCount) {
      habits.sort((a, b) {
        return a.timestamp.compareTo(b.timestamp);
      });
      widget.lastHabitCount = habits.length;
    }
    */

    return ReorderableListView.builder(
        itemBuilder: (context, index) {
          return HabitCard(key: Key(habits[index].id!), habit: habits[index]);
        },
        itemCount: habits.length,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final Habit item = habits.removeAt(oldIndex);
            habits.insert(newIndex, item);
          });
        });
  }

  Widget _displayError(HabitsState state) {
    return displayErrorMessage();
  }
}
