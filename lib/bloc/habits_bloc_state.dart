part of 'habits_bloc_bloc.dart';

abstract class HabitsBlocState extends Equatable {
  const HabitsBlocState();

  @override
  List<Object> get props => [];
}

class HabitsLoading extends HabitsBlocState {}

class HabitsLoaded extends HabitsBlocState {
  final List<Habit> habits;

  const HabitsLoaded([this.habits = const []]);

  @override
  List<Object> get props => [habits];

  @override
  String toString() => 'HabitsLoadSuccess { habits: $habits }';
}

class HabitsError extends HabitsBlocState {}
