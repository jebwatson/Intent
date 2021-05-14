import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

// Release vs Debug
bool get releaseMode => kReleaseMode;

// View specifications
double get defaultPadding => 20;
double get defaultBorderRadius => 20;

// Text styles
TextStyle withDefaultTextStyle(
    {double size = 14, FontStyle style = FontStyle.normal}) {
  return TextStyle(fontSize: size, fontFamily: "Playfair", fontStyle: style);
}

TextStyle withHeaderTextStyle(
    {double size = 20, FontStyle style = FontStyle.normal}) {
  return TextStyle(fontSize: size, fontFamily: "Playfair", fontStyle: style);
}

TextStyle withButtonTextStyle({
  double size = 20,
  FontStyle style = FontStyle.normal,
  FontWeight weight = FontWeight.w500,
}) {
  return TextStyle(
      fontSize: size,
      fontFamily: "Playfair",
      fontStyle: style,
      fontWeight: weight);
}
