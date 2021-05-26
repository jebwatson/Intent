import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intent/entities/habit_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'habit_entity_test.mocks.dart';

@GenerateMocks([DocumentSnapshot])
void main() {
  final Timestamp timestamp = Timestamp.fromDate(DateTime.now());

  test('toJson performs as expected', () {
    var uut = HabitEntity('1', 'test', timestamp);

    var result = uut.toJson();
    expect(result, {'title': 'test', 'timestamp': timestamp});
  });

  test('fromJson performs as expected', () {
    var control = HabitEntity('1', 'test', timestamp);
    var result = HabitEntity.fromJson({'id': '1', 'title': 'test', 'timestamp': timestamp});
    expect(result, control);
  });

  test('fromSnapshot performs as expected', () {
    var control = HabitEntity('1', 'test', timestamp);
    var snap = MockDocumentSnapshot();

    when(snap.id).thenReturn('1');
    when(snap.get('title')).thenReturn('test');
    when(snap.get('timestamp')).thenReturn(timestamp);

    var result = HabitEntity.fromSnapshot(snap);
    expect(result, control);
  });

  test('toDocument performs as expected', () {
    var uut = HabitEntity('1', 'test', timestamp);

    var result = uut.toDocument();
    expect(result, {'title': 'test', 'timestamp': timestamp});
  });

  test('toString performs as expected', () {
    var uut = HabitEntity('1', 'test', timestamp);

    var result = uut.toString();
    expect(result, 'Habit Entity { id: 1, title: test, timestamp: $timestamp }');
  });

  test('props performs as expected', () {
    var uut = HabitEntity('1', 'test', timestamp);

    var result = uut.props;
    expect(result, {uut.id, uut.title, uut.timestamp});
  });
}