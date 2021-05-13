import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class HabitEntity extends Equatable {
  final String id;
  final String title;
  final Timestamp timestamp;

  HabitEntity(this.id, this.title, this.timestamp);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'title': title,
      'timestamp': timestamp,
    };
  }

  static HabitEntity fromJson(Map<String, Object> json) {
    return HabitEntity(
      json['id'] as String,
      json['title'] as String,
      json['timestamp'] as Timestamp,
    );
  }

  static HabitEntity fromSnapshot(DocumentSnapshot snap) {
    return HabitEntity(
      snap.id,
      snap.get('title'),
      snap.get('timestamp'),
    );
  }

  Map<String, Object> toDocument() {
    return {
      'title': title,
      'timestamp': timestamp,
    };
  }

  @override
  String toString() {
    return 'Habit Entity { id: $id, title: $title, timestamp: $timestamp }';
  }

  @override
  List<Object?> get props => [id, title, timestamp];
}
