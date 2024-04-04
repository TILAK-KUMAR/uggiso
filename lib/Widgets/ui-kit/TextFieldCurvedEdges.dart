import 'package:flutter/material.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/fonts.dart';

class TextFieldCurvedEdges extends StatelessWidget {
  final TextEditingController controller;
  final Color backgroundColor;
  final TextInputType keyboardType;
  final Color borderColor;
  final double borderRadius;

  const TextFieldCurvedEdges({
    Key? key,
    required this.controller,
    required this.backgroundColor,
    required this.keyboardType,
    required this.borderColor,
    this.borderRadius = 20.0,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color:borderColor)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          style: AppFonts.title.copyWith(color: AppColors.black),
          controller: controller,
          cursorColor: AppColors.black,
          keyboardType: keyboardType,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}