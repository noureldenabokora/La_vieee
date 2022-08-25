import 'package:flutter/material.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/font_manager.dart';
import 'package:la_vie/presentation/resources/styles_manager.dart';
import 'package:la_vie/presentation/resources/values_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorManger.primary,

    // card them
    cardTheme: CardTheme(
      color: ColorManger.white,
      elevation: AppSize.s4,
      shadowColor: ColorManger.darkGrey,
    ),

    //App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: AppSize.s4,
      color: ColorManger.primary,
      titleTextStyle:
          getRegularStyle(size: FontSize.s16, color: ColorManger.white),
    ),

    // button theme
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManger.primary,
      splashColor: ColorManger.primary,
      disabledColor: ColorManger.lightGrey,
      shape: const StadiumBorder(),
    ),
    //elveted button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManger.primary,
          size: FontSize.s17,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        primary: ColorManger.primary,
      ),
    ),

    // text theme
    textTheme: TextTheme(
      headline1:
          getSemiboldStyle(color: ColorManger.darkGrey, size: FontSize.s16),
      subtitle1:
          getMediumStyle(color: ColorManger.lightGrey, size: FontSize.s14),
      caption: getRegularStyle(color: ColorManger.darkGrey),
      bodyText1: getRegularStyle(color: ColorManger.darkGrey),
    ),

    //text form field theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p12),
      hintStyle:
          getRegularStyle(color: ColorManger.darkGrey, size: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManger.darkGrey, size: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManger.error),
      //enable border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //foucs border
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManger.darkGrey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //foucs error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
