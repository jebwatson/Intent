part of 'habits_bloc.dart';

abstract class HabitsEvent extends Equatable {
  const HabitsEvent();

  @override
  List<Object> get props => [];
}

/// Tells the bloc that it needs to load habits from the repository
class HabitsLoadRequested extends HabitsEvent {}

/// Tells the bloc that the habits list has completed an update
class HabitsUpdated extends HabitsEvent {
  final List<Habit> habits;
  HabitsUpdated(this.habits);
}

class HabitAdded extends HabitsEvent {
  final Habit habit;
  HabitAdded(this.habit);
}
