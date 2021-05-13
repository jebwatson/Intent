import 'package:intent/models/Habit.dart';
import 'package:intent/providers/HabitProvider.dart';

class DummyHabitProvider implements HabitProvider {
  @override
  List<Habit> getHabits() {
    return List<Habit>.generate(
        15, (index) => new Habit("Habit Title", DateTime.now()));
  }
}
