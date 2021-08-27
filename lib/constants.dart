import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Release vs Debug
bool get releaseMode => true; //kReleaseMode;

// View specifications
class LayoutValues {
  static double get defaultPadding => 10;
  static double get defaultBorderRadius => 20;
}

// Text styles
class TextStyles {
  static TextStyle get defaultText => TextStyle(
        fontSize: 14,
        fontFamily: "Playfair",
        fontStyle: FontStyle.normal,
      );

  static TextStyle get header => TextStyle(
        fontSize: 20,
        fontFamily: "Playfair",
        fontStyle: FontStyle.normal,
      );

  static TextStyle get button => TextStyle(
        fontSize: 20,
        fontFamily: "Playfair",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: CustomColors.buttonForeground,
      );
}

class ButtonStyles {
  static ButtonStyle get dialog => ButtonStyle(
      backgroundColor: MaterialStateProperty.all(CustomColors.buttonBackground),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(LayoutValues.defaultBorderRadius))));
}

// Colors
class CustomColors {
  static Color get darkBackground => Color(0xFF353535);
  static Color get darkItemBackground => Color(0xFF3F3F3F);
  static Color get buttonBackground => Colors.teal;
  static Color get buttonForeground => Colors.white;
}
