import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/constants/colors.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap, required this.bgColor,
  }) : super(key: key);
  final String text;
  final Color color;
  final Color bgColor;
  // final VoidCallbackAction onTap;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      decoration:  BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(color: color, fontSize: 20),
        ),
      ),
    );
  }
}
