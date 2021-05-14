import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intent/constants.dart';
import 'package:intent/views/widgets/submission_button.dart';

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
            padding: EdgeInsets.only(top: defaultPadding + 20),
            child: Text(
              "Let's start a new habit!",
              style: withHeaderTextStyle(),
            ),
          ),
          // Content area
          Container(
            padding: EdgeInsets.all(defaultPadding),
            child: Text(
              "Add new habit controls go here...",
              style: withDefaultTextStyle(),
            ),
          ),
          // Button area
          Container(
            padding: EdgeInsets.all(defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubmissionButton("Cancel"),
                SubmissionButton("Submit"),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
