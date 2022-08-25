import 'package:flutter/cupertino.dart';
import 'package:la_vie/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(
  double size,
  Color color,
  FontWeight fontWeight,
) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontWeight: fontWeight,
    fontFamily: FontConatants.fontFamily,
  );
}

// regular style
TextStyle getRegularStyle({
  double size = FontSize.s14,
  required Color color,
}) {
  return _getTextStyle(
    size,
    color,
    FontWeightManager.regular,
  );
}

// light style
TextStyle getLightStyle({
  double size = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    size,
    color,
    FontWeightManager.light,
  );
}

// medium style
TextStyle getMediumStyle({
  double size = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    size,
    color,
    FontWeightManager.meduim,
  );
}

// bold style
TextStyle getBoldStyle({
  double size = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    size,
    color,
    FontWeightManager.bold,
  );
}

// semi bold style
TextStyle getSemiboldStyle({
  double size = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    size,
    color,
    FontWeightManager.semiBold,
  );
}
