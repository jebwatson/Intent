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
      HabitAdded: _handleHabitAddedEvent,
    });
  }

  @override
  Stream<HabitsState> mapEventToState(
    HabitsEvent event,
  ) async* {
    yield* eventToStateMap[event.runtimeType]?.call(event) ?? HabitsError();
  }

  /// Sets up a subscription to the repositories habits stream
  /// Issues update events each time the stream changes
  Stream<HabitsState> _handleHabitsLoadRequestedEvent(
      HabitsEvent event) async* {
    _habitsSubsciption?.cancel();
    _habitsSubsciption = _habitRepository.habits().listen((habits) {
      add(HabitsUpdated(habits));
    });
  }

  /// Yields the habits loaded state each time an update event comes in
  /// The habits loaded state contains the latest habits list
  Stream<HabitsState> _handleHabitsUpdatedEvent(HabitsEvent event) async* {
    yield HabitsLoaded((event as HabitsUpdated).habits);
  }

  /// First yields a loading state, then adds the new habit to the repo
  /// When the new habit is added the stream subscription add an updated event
  Stream<HabitsState> _handleHabitAddedEvent(HabitsEvent event) async* {
    yield HabitsLoading();
    _habitRepository.addHabit((event as HabitAdded).habit.toEntity());
  }

  void dispose() {
    _habitsSubsciption?.cancel();
  }
}
