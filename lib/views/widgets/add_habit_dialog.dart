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
        borderRadius: BorderRadius.circular(LayoutValues.defaultBorderRadius),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Theme.of(context).primaryColor,
        child: Stack(
          children: [
            // Title area
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: LayoutValues.defaultPadding + 20),
                child: Text(
                  "Let's start a new habit!",
                  style: TextStyles.header,
                ),
              ),
            ),
            // Content area
            Center(
              child: Padding(
                padding: EdgeInsets.all(LayoutValues.defaultPadding),
                child: Text(
                  "Add new habit controls go here...",
                  style: TextStyles.defaultText,
                ),
              ),
            ),
            // Button area
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: LayoutValues.defaultPadding + 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SubmissionButton("Cancel"),
                    SubmissionButton("Submit"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
