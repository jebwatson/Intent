import 'package:intent/models/habit.dart';
import 'package:intent/repositories/habits/habit_repository.dart';

class DummyHabitRepo implements HabitRepository {
  final List<Habit> _habits = List<Habit>.generate(
      15,
      (index) =>
          new Habit((index + 1).toString(), "Habit Title", DateTime.now()));

  @override
  Stream<List<Habit>> habits() async* {
    await Future.delayed(Duration(seconds: 2));
    yield _habits;
  }
}
