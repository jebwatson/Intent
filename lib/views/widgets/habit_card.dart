import 'package:flutter/material.dart';
import 'package:intent/models/habit.dart';

class HabitCard extends StatelessWidget {
  final Habit habit;

  const HabitCard({Key? key, required this.habit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: ListTile(
        leading: Icon(
          Icons.repeat,
          color: Theme.of(context).iconTheme.color,
        ),
        title: Text(habit.title),
        subtitle: Text(habit.timestamp),
      ),
    );
  }
}
