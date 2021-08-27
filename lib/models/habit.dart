import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:intent/entities/habit_entity.dart';

class Habit {
  final String? id;
  final String title;
  final DateTime _timestamp;
  final int? listPosition;

  Habit({
    String? id,
    required String title,
    DateTime? timestamp,
    int? listPosition,
  })  : this.id = id ?? id,
        this.title = title,
        this._timestamp = timestamp ?? DateTime.now(),
        this.listPosition = listPosition;

  static Habit empty() => Habit(title: '');

  String get timestamp =>
      DateTimeFormat.format(_timestamp, format: DateTimeFormats.american);

  Habit copyWith({
    String? id,
    String? title,
    DateTime? timestamp,
    int? listPosition,
  }) {
    return Habit(
      id: id ?? this.id,
      title: title ?? this.title,
      timestamp: timestamp ?? this._timestamp,
      listPosition: listPosition ?? this.listPosition,
    );
  }

  HabitEntity toEntity() {
    return HabitEntity(id, title, Timestamp.fromDate(_timestamp));
  }

  static Habit fromEntity(HabitEntity entity) {
    return Habit(
      id: entity.id,
      title: entity.title,
      timestamp: entity.timestamp.toDate(),
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      _timestamp.hashCode ^
      listPosition.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Habit &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          _timestamp == other._timestamp &&
          listPosition == other.listPosition;

  @override
  String toString() {
    return 'Habit { id: $id, title: $title, timestamp: $_timestamp, listPosition: $listPosition, }';
  }
}
