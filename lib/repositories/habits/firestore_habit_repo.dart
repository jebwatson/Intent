import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intent/entities/habit_entity.dart';
import 'package:intent/models/habit.dart';
import 'package:intent/repositories/habits/habit_repository.dart';

class FirebaseHabitRepo implements HabitRepository {
  final habitCollection = FirebaseFirestore.instance.collection('habits');

  @override
  Stream<List<Habit>> habits() {
    return habitCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Habit.fromEntity(HabitEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> addHabit(HabitEntity habit) {
    return FirebaseFirestore.instance
        .collection('habits')
        .doc(habit.id)
        .set(habit.toJson());
  }
}
