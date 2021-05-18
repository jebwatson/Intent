import 'package:intent/entities/habit_entity.dart';
import 'package:intent/models/habit.dart';

abstract class HabitRepository {
  Stream<List<Habit>> habits();
  Future<void> addHabit(HabitEntity habit);
}
