import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intent/models/habit.dart';
import 'package:intent/repositories/habits/habit_repository.dart';

part 'habits_event.dart';
part 'habits_state.dart';

class HabitsBloc extends Bloc<HabitsEvent, HabitsState> {
  final Map<Type, Function> eventToStateMap = HashMap();
  final HabitRepository _habitRepository;
  StreamSubscription? _habitsSubsciption;

  HabitsBloc({required habitRepository})
      : _habitRepository = habitRepository,
        super(HabitsLoading()) {
    eventToStateMap.addAll({
      HabitsLoadRequested: _handleHabitsLoadRequestedEvent,
      HabitsUpdated: _handleHabitsUpdatedEvent,
    });
  }

  @override
  Stream<HabitsState> mapEventToState(
    HabitsEvent event,
  ) async* {
    yield* eventToStateMap[event.runtimeType]?.call(event) ?? HabitsError();
  }

  Stream<HabitsState> _handleHabitsLoadRequestedEvent(
      HabitsEvent event) async* {
    _habitsSubsciption?.cancel();
    _habitsSubsciption = _habitRepository.habits().listen((habits) {
      add(HabitsUpdated(habits));
    });
  }

  Stream<HabitsState> _handleHabitsUpdatedEvent(HabitsEvent event) async* {
    yield HabitsLoaded((event as HabitsUpdated).habits);
  }

  void dispose() {
    _habitsSubsciption?.cancel();
  }
}
