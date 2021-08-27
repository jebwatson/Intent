import 'package:intent/entities/habit_entity.dart';
import 'package:intent/models/habit.dart';
import 'package:intent/repositories/habits/firestore_collection.dart';
import 'package:intent/repositories/habits/habit_repository.dart';

class FirestoreHabitRepo implements HabitRepository {
  FirestoreCollection habitCollection;

  FirestoreHabitRepo(this.habitCollection);

  @override
  Stream<List<Habit>> habits() {
    return habitCollection.snapshots.map((snapshot) {
      return snapshot.docs
          .map((doc) => Habit.fromEntity(HabitEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> addHabit(HabitEntity habit) {
    return habitCollection.doc(habit.id).set(habit.toJson());
  }

  @override
  Future<void> removeHabit(HabitEntity habit) {
    return habitCollection.doc(habit.id).delete();
  }
}
