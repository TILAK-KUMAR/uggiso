import 'dart:ui';

import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;
  final double cornerRadius;
  final Color buttonColor;
  final TextStyle textStyle;

  const RoundedElevatedButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
    required this.cornerRadius,
    required this.buttonColor,
    required this.textStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius), // Adjust the value as needed
          ),
        ),
        child: Text(text,style: textStyle,),
      ),
    );
  }
}