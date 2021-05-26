import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intent/entities/habit_entity.dart';
import 'package:intent/models/habit.dart';

void main(){
  final DateTime timestamp = DateTime.now();
  
  test('timestamp returns correct format', () {
    var uut = Habit(title: 'test', timestamp: timestamp);
    var control = DateTimeFormat.format(timestamp, format: DateTimeFormats.american);

    var result = uut.timestamp;
    expect(result, control);
  });

  test('copyWith performs as expected', () {
    var timestamp2 = DateTime.now();
    var uut = Habit(id: '1', title: 'test', timestamp: timestamp, listPosition: 1);
    var control = Habit(id: '2', title: 'test2', timestamp: timestamp2, listPosition: 2);

    var result1 = uut.copyWith();
    expect(result1, uut);

    var result2 = uut.copyWith(id: '2', title: 'test2', timestamp: timestamp2, listPosition: 2);
    expect(result2, control);
  });

  test('toEntity performs as expected', () {
    var uut = Habit(id: '1', title: 'test', timestamp: timestamp, listPosition: 1);
    var control = HabitEntity('1', 'test', Timestamp.fromDate(timestamp));

    var result = uut.toEntity();
    expect(result, control);
  });

  test('fromEntity performs as expected', () {
    var entity = HabitEntity('1', 'test', Timestamp.fromDate(timestamp));
    var control = Habit(id: '1', title: 'test', timestamp: timestamp);

    var result = Habit.fromEntity(entity);
    expect(result, control);
  });

  test('hashCode performs as expected', () {
    var uut = Habit(id: '1', title: 'test', timestamp: timestamp, listPosition: 1);

    var result = uut.hashCode;
    expect(result, uut.id.hashCode ^
      uut.title.hashCode ^
      timestamp.hashCode ^
      uut.listPosition.hashCode);
  });

  test('== behaves as expected', () {
    var uut = Habit(id: '1', title: 'test', timestamp: timestamp, listPosition: 1);
    var control = Habit(id: '1', title: 'test', timestamp: timestamp, listPosition: 1);

    expect(true, uut == control);
  });

  test('toString behaves as expected', () {
    var uut = Habit(id: '1', title: 'test', timestamp: timestamp, listPosition: 1);

    var result = uut.toString();
    expect(result, 'Habit { id: 1, title: test, timestamp: $timestamp, listPosition: 1, }');
  });
}