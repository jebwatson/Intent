import 'package:flutter/material.dart';
import 'package:intent/constants.dart';

class SubmissionButton extends StatelessWidget {
  final String text;
  final Function? pressed;

  const SubmissionButton(this.text, {Key? key, Function? pressed})
      : this.pressed = pressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          pressed?.call();
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
