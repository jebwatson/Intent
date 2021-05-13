import 'package:intent/models/habit.dart';
import 'package:intent/repositories/habits/habit_repository.dart';

class DummyHabitRepo implements HabitRepository {
  @override
  List<Habit> getHabits() {
    return List<Habit>.generate(
        15,
        (index) =>
            new Habit((index + 1).toString(), "Habit Title", DateTime.now()));
  }
}
