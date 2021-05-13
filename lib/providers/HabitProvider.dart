import 'package:intent/models/Habit.dart';

abstract class HabitProvider {
  List<Habit> getHabits();
}
