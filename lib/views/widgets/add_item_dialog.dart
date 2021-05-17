import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intent/constants.dart';
import 'package:intent/views/widgets/item_picker.dart';
import 'package:intent/views/widgets/submission_button.dart';

class AddItemDialog extends StatelessWidget {
  final String title;

  const AddItemDialog(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LayoutValues.defaultBorderRadius),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 320,
        width: MediaQuery.of(context).size.width * .9,
        child: Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              // Title area
              Padding(
                padding: EdgeInsets.only(
                    top: LayoutValues.defaultPadding + 20,
                    bottom: LayoutValues.defaultPadding),
                child: Text(
                  title,
                  style: TextStyles.header,
                ),
              ),
              // Title
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: LayoutValues.defaultPadding,
                  horizontal: LayoutValues.defaultPadding + 20,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    labelText: 'Enter habit name',
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    // TODO: validation
                  },
                ),
              ),
              // Type Picker
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: LayoutValues.defaultPadding,
                  horizontal: LayoutValues.defaultPadding,
                ),
                child: ItemPicker(),
              ),
              // Buttons
              Container(
                margin: EdgeInsets.only(top: LayoutValues.defaultPadding + 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SubmissionButton("Cancel"),
                    SubmissionButton("Submit"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
