import 'dart:js';

import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/widgets.dart';

class ItemPicker extends StatefulWidget {
  final List<String> items = [
    'Annual',
    'Monthly',
    'Weekly',
    'Daily',
    'Hourly',
    'Timed',
    'Custom',
  ];

  ItemPicker({Key? key}) : super(key: key);

  @override
  _ItemPickerState createState() => _ItemPickerState();
}

class _ItemPickerState extends State<ItemPicker> {
  @override
  Widget build(BuildContext context) {
    return DirectSelectList(
        values: widget.items,
        itemBuilder: (String item) {
          return getItem(item);
        });
  }
}

DirectSelectItem<String> getItem(String value) {
  return DirectSelectItem(
      itemHeight: 56,
      value: value,
      itemBuilder: (context, value) {
        return Text(value);
      });
}
