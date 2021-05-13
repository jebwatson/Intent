part of 'habits_bloc_bloc.dart';

abstract class HabitsBlocEvent extends Equatable {
  const HabitsBlocEvent();

  @override
  List<Object> get props => [];
}

/// Tells the bloc that it needs to load habits from the repository
class HabitsLoadRequested extends HabitsBlocEvent {}

/// Tells the bloc that the habits list has completed an update
class HabitsUpdated extends HabitsBlocEvent {
  final List<Habit> habits;
  HabitsUpdated(this.habits);
}
