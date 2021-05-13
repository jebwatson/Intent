import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intent/models/habit.dart';
import 'package:intent/repositories/habits/habit_repository.dart';
import 'package:intent/views/habit_card.dart';

class HabitsList extends StatefulWidget {
  final List<Habit> _habits;

  HabitsList({Key? key, required HabitRepository habitProvider})
      : _habits = habitProvider.getHabits(),
        super(key: key);

  @override
  _HabitsListState createState() => _HabitsListState();
}

class _HabitsListState extends State<HabitsList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final habit = widget._habits[index];
          return HabitCard(
            habit: habit,
          );
        },
        itemCount: widget._habits.length,
      ),
    );
  }
}
