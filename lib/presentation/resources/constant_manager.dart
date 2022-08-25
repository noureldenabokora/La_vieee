import 'package:flutter/material.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/font_manager.dart';

class Constant {
  static const int delaySplash = 1;
  static const int durationSplash = 2000;

  static const String signupTabbar = 'SignUp';

  static const String loginTabbar = 'Login';

  static Widget deafualtTextformField({
    required TextEditingController controller,
    void Function()? onTap,
    required void Function(String?)? saved,
    void Function(String?)? submitted,
    String? Function(String?)? validator,
    TextInputType? keybordtype,
    String lable = '',
    Widget? icon,
    Widget? suffixicon,
    required bool obsecure,
    void Function(String)? onChange,
    InputBorder? enableborder,
    String? hittext,
  }) =>
      TextFormField(
        controller: controller,
        onTap: onTap,
        onChanged: onChange,

        obscureText: obsecure,
        keyboardType: keybordtype,

        // textAlignVertical: TextAlignVertical.top,
        //textAlign: TextAlign.start,
        style: const TextStyle(
          //   color: Colors.black,
          fontFamily: 'Poppins',
        ),
        decoration: InputDecoration(
          labelText: lable,
          prefixIcon: icon,
          hintText: hittext,
          suffixIcon: suffixicon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          focusColor: Colors.blue,
          fillColor: Colors.blue,
          hoverColor: Colors.blue,
          enabledBorder: enableborder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        onSaved: saved,
        onFieldSubmitted: submitted,
        validator: validator,
      );

  static Widget deafaultButton({
    required String buttonText,
    required void Function()? onPressed,
    context,
    Color buttonColor = ColorManger.primary,
  }) =>
      FlatButton(
        onPressed: onPressed,
        color: buttonColor,
        textColor: Colors.white,
        minWidth: double.infinity,
        height: 45,
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: FontSize.s12,
                color: ColorManger.white,
              ),
        ),
      );
}
