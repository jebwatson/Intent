import 'package:flutter/material.dart';

import 'constants.dart';

class IntentTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: CustomColors.darkItemBackground,
      scaffoldBackgroundColor: CustomColors.darkBackground,
      accentColor: CustomColors.buttonBackground,
      fontFamily: 'Playfair',
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        buttonColor: CustomColors.buttonBackground,
      ),
      textTheme: ThemeData.dark().textTheme,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }
}
