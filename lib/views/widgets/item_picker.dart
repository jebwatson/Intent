import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intent/constants.dart';

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

  var selectedIndex = 0;

  List<Widget> _buildItems() {
    return items.map((item) => Text(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DirectSelect(
        items: _buildItems(),
        onSelectedItemChanged: (index) {
          setState(() {
            selectedIndex = index ?? 0;
          });
        },
        itemExtent: 35.0,
        child: MySelectionItem(
          title: "What kind of habit is this?",
          isForList: false,
        ));
  }
}

class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key? key, required this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: EdgeInsets.all(10.0),
            )
          : Card(
              color: CustomColors.darkItemBackground,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
            ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(title),
    );
  }
}
