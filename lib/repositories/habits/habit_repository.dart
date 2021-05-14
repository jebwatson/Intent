import 'package:intent/models/habit.dart';

abstract class HabitRepository {
  Stream<List<Habit>> habits();
}
