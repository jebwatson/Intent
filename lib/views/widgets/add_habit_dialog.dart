import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intent/constants.dart';

class AddHabitDialog extends StatelessWidget {
  const AddHabitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Material(
          child: Column(
        children: [
          // Title area
          Container(
            padding: EdgeInsets.all(defaultPadding),
            child: Text("Let's start a new habit!"),
          ),
          // Content area
          Container(
            padding: EdgeInsets.all(defaultPadding),
            child: Text("Add new habit controls go here..."),
          ),
          // Button area
          Container(
            padding: EdgeInsets.all(defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    // Route back (or close dialog?)
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: Text("Submit"),
                  onPressed: () {
                    // Perform validation?
                    // Save habit if valid
                    // Route back to habits (or close dialog?)
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
