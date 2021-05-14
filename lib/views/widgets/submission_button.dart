import 'package:flutter/material.dart';
import 'package:intent/constants.dart';

class SubmissionButton extends StatelessWidget {
  final String text;

  const SubmissionButton(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: LayoutValues.defaultPadding,
            horizontal: LayoutValues.defaultPadding + 40,
          ),
          child: Text(
            text,
            style: TextStyles.button,
          ),
        ),
        style: ButtonStyles.dialog,
      ),
    );
  }
}
