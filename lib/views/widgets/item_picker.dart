import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemPicker extends StatefulWidget {
  ItemPicker({Key? key}) : super(key: key);

  @override
  _ItemPickerState createState() => _ItemPickerState();
}

class _ItemPickerState extends State<ItemPicker> {
  final items = [
    'Annual',
    'Monthly',
    'Weekly',
    'Daily',
    'Hourly',
    'Timed',
    'Custom',
  ];

  int selectedIndex = 0;

  List<Widget> _buildItems() {
    return items.map((e) => HabitTypeSelection(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DirectSelect(
        itemExtent: 35.0,
        backgroundColor: Theme.of(context).primaryColor,
        selectedIndex: selectedIndex,
        items: _buildItems(),
        child: HabitTypeSelection(
          items[selectedIndex],
          isForList: false,
        ),
        onSelectedItemChanged: (index) {
          setState(() {
            selectedIndex = index ?? 0;
          });
        });
  }
}

class HabitTypeSelection extends StatelessWidget {
  final title;
  final isForList;

  const HabitTypeSelection(this.title, {Key? key, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: _buildItem(context),
            )
          : Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              color: Theme.of(context).primaryColor,
              child: Stack(
                children: [
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down),
                  )
                ],
              )),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 14.0)),
    );
  }
}
