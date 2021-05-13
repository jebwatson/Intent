import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intent/models/habit.dart';
import 'package:intent/repositories/habits/habit_repository.dart';

part 'habits_bloc_event.dart';
part 'habits_bloc_state.dart';

class HabitsBlocBloc extends Bloc<HabitsBlocEvent, HabitsBlocState> {
  final Map<Type, Function> eventToStateMap = HashMap();
  final HabitRepository _habitRepository;
  StreamSubscription? _habitsSubsciption;

  HabitsBlocBloc({required habitRepository})
      : _habitRepository = habitRepository,
        super(HabitsLoading()) {
    eventToStateMap.addAll({
      HabitsLoadRequested: _handleHabitsLoadRequestedEvent,
      HabitsUpdated: _handleHabitsUpdatedEvent,
    });
  }

  @override
  Stream<HabitsBlocState> mapEventToState(
    HabitsBlocEvent event,
  ) async* {
    yield* eventToStateMap[event.runtimeType]?.call(event) ?? HabitsError();
  }

  Stream<HabitsBlocState> _handleHabitsLoadRequestedEvent(
      HabitsBlocEvent event) async* {
    _habitsSubsciption?.cancel();
    _habitsSubsciption = _habitRepository.habits().listen((habits) {
      add(HabitsUpdated(habits));
    });
  }

  Stream<HabitsBlocState> _handleHabitsUpdatedEvent(
      HabitsBlocEvent event) async* {
    yield HabitsLoaded((event as HabitsUpdated).habits);
  }

  void dispose() {
    _habitsSubsciption?.cancel();
  }
}
