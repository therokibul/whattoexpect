import 'package:flutter/material.dart';
import 'package:whattoexpect/constants/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();
  static InputDecoration lightInputDecorationTheme = const InputDecoration(
    border: OutlineInputBorder(),
    prefixIconColor: secendaryColor,
    floatingLabelStyle: TextStyle(color: secendaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: secendaryColor),
    ),
  );
}
