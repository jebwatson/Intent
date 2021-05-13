import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intent/bloc/habits_bloc.dart';
import 'package:intent/repositories/habits/habit_repository.dart';

class MockHabitBloc extends MockBloc<HabitsEvent, HabitsState>
    implements HabitsBloc {}

class HabitRepositoryFake extends Fake implements HabitRepository {}

void main() {
  group('HabitsBloc', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => HabitsBloc(habitRepository: HabitRepositoryFake()),
      expect: () => [],
    );
  });
}
