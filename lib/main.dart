import 'package:flutter/material.dart';

import 'models/habit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intent',
      theme: ThemeData.dark(),
      home: HabitsPage(),
    );
  }
}

class HabitsPage extends StatefulWidget {
  final List<Habit> _habits = List<Habit>.generate(
      15, (index) => new Habit("Habit Title", DateTime.now()));

  HabitsPage({Key? key}) : super(key: key);

  @override
  _HabitsPageState createState() => _HabitsPageState();
}

class _HabitsPageState extends State<HabitsPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final habit = widget._habits[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.repeat),
              title: Text(habit.title),
              subtitle: Text(habit.timestamp.toString()),
            ),
          );
        },
        itemCount: widget._habits.length,
      ),
    );
  }
}
