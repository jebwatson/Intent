import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intent/bloc/habits_bloc.dart';
import 'package:intent/models/habit.dart';
import 'package:intent/repositories/habits/habit_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'habit_bloc_test.mocks.dart';

class MockHabitBloc extends MockBloc<HabitsEvent, HabitsState>
    implements HabitsBloc {}

@GenerateMocks([HabitRepository, HabitsBloc])
void main() {
  group('Initialization', () {
    List<Habit> habits = List.empty();
    Stream<List<Habit>> habitsStream = Stream.empty();
    HabitRepository habitRepository = MockHabitRepository();

    setUp(() {
      habits = List<Habit>.generate(
          2,
          (index) => new Habit(
              id: (index + 1).toString(),
              title: "Habit Title",
              timestamp: DateTime.now()));

      habitsStream = Stream.value(habits);
      when(habitRepository.habits())
          .thenAnswer((realInvocation) => habitsStream);
    });

    blocTest(
      'emits [] when nothing is added',
      build: () => HabitsBloc(habitRepository: habitRepository),
      expect: () => [],
    );

    blocTest(
      'emits [HabitsLoaded] when HabitsLoadRequested event is added',
      build: () => HabitsBloc(habitRepository: habitRepository)
        ..add(HabitsLoadRequested()),
      expect: () => [HabitsLoaded(habits)],
    );
  });

  group('HabitAdded', () {
    List<Habit> habits = List.empty();
    Stream<List<Habit>> habitsStreamAfterAdd = Stream.empty();
    HabitRepository habitRepository = MockHabitRepository();
    final additionalHabit = Habit(title: 'test');

    setUp(() {
      habits = List<Habit>.generate(
          2,
          (index) => new Habit(
              id: (index + 1).toString(),
              title: "Habit Title",
              timestamp: DateTime.now()));
      habitsStreamAfterAdd = Stream.value(habits);

      habits.add(additionalHabit);
      when(habitRepository.habits())
          .thenAnswer((realInvocation) => habitsStreamAfterAdd);
      when(habitRepository.addHabit(additionalHabit.toEntity()))
          .thenAnswer((realInvocation) => Future.delayed(Duration(seconds: 0)));
    });

    blocTest(
      'emits [HabitsLoading] when HabitAdded event is added',
      build: () => HabitsBloc(habitRepository: habitRepository)
        ..add(HabitAdded(Habit(title: "test"))),
      expect: () => [HabitsLoading()],
    );

    blocTest(
      'emits [HabitsLoading, HabitsLoaded] when [HabitsLoadRequested, HabitAdded] events are added',
      build: () {
        return HabitsBloc(habitRepository: habitRepository)
          ..add(HabitsLoadRequested());
      },
      act: (HabitsBloc bloc) {
        bloc.add(HabitAdded(additionalHabit));
      },
      expect: () => [
        HabitsLoading(),
        HabitsLoaded(habits),
      ],
    );
  });

  group('HabitsUpdated', () {
    final controller = StreamController<List<Habit>>.broadcast(sync: false);
    List<Habit> habits = List.from([Habit(title: 'test')]);
    List<Habit> habits2 =
        List.from([Habit(title: 'test'), Habit(title: 'test')]);
    Stream<List<Habit>> habitsStream = controller.stream;
    HabitRepository habitRepository = MockHabitRepository();

    setUp(() {
      when(habitRepository.habits())
          .thenAnswer((realInvocation) => habitsStream);
    });

    test('test', () async {
      final habitsBloc = new MockHabitsBloc();
      final iterable = [
        HabitsUpdated(habits),
        HabitsUpdated(habits2),
      ];

      whenListen(
        habitsBloc,
        Stream.fromIterable(iterable),
        initialState: HabitsLoadRequested(),
      );

      expect(habitsBloc.state, equals(HabitsLoadRequested()));

      await expectLater(habitsBloc.stream, emitsInOrder(iterable));

      expect(habitsBloc.state, equals(iterable[1]));
    });

    test(
      'emits [HabitsLoaded] for each HabitsUpdated event added',
      () async {
        var bloc = HabitsBloc(habitRepository: habitRepository);
        bloc..add(HabitsLoadRequested());

        for (int x = 0; x < 4; x++) {
          habits.add(Habit(title: 'test', id: x.toString()));
          controller.add(habits);
        }

        await expectLater(
            bloc.stream,
            emitsInOrder([
              HabitsLoaded(habits),
              HabitsLoaded(habits),
              HabitsLoaded(habits),
              HabitsLoaded(habits),
            ]));
      },
    );

    tearDown(() {
      controller.close();
    });
  });
}
