import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:intent/entities/habit_entity.dart';

class Habit {
  final String id;
  final String title;
  final DateTime _timestamp;

  Habit(this.id, this.title, this._timestamp);

  String get timestamp =>
      DateTimeFormat.format(_timestamp, format: DateTimeFormats.american);

  Habit copyWith({String? id, String? title, DateTime? timestamp}) {
    return Habit(
      id ?? this.id,
      title ?? this.title,
      timestamp ?? this._timestamp,
    );
  }

  HabitEntity toEntity() {
    return HabitEntity(id, title, Timestamp.fromDate(_timestamp));
  }

  static Habit fromEntity(HabitEntity entity) {
    return Habit(
      entity.id,
      entity.title,
      entity.timestamp.toDate(),
    );
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ _timestamp.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Habit &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          _timestamp == other._timestamp;

  @override
  String toString() {
    return 'Habit { id: $id, title: $title, timestamp: $_timestamp }';
  }
}
