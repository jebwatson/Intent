import 'package:intent/entities/habit_entity.dart';
import 'package:intent/models/habit.dart';
import 'package:intent/repositories/habits/habit_repository.dart';
import 'package:logger/logger.dart';

class DummyHabitRepo implements HabitRepository {
  final List<Habit> _habits = List<Habit>.generate(
      2,
      (index) => new Habit(
          id: (index + 1).toString(),
          title: "Habit Title",
          timestamp: DateTime.now()));
  final Logger _logger;

  DummyHabitRepo(this._logger);

  @override
  Stream<List<Habit>> habits() async* {
    yield _habits;
  }

  @override
  Future<void> addHabit(HabitEntity habit) {
    _habits.add(Habit.fromEntity(habit));
    return Future.delayed(Duration(seconds: 0));
  }
}
