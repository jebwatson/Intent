import 'package:intent/models/habit.dart';

abstract class HabitRepository {
  List<Habit> getHabits();
}
