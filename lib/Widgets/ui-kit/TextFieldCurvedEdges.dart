import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/fonts.dart';

class TextFieldCurvedEdges extends StatelessWidget {
  final TextEditingController controller;
  final Color backgroundColor;
  final TextInputType keyboardType;
  final Color borderColor;
  final double borderRadius;
  final TextAlign textAlign;
  final int length;
  final FocusNode? focusNode;
  final ValueChanged<String>? onSubmitted;
  final String? inputFormatter;
  final String? validatorType;

  const TextFieldCurvedEdges({
    Key? key,
    required this.controller,
    required this.backgroundColor,
    required this.keyboardType,
    required this.borderColor,
    this.borderRadius = 20.0,
    this.textAlign = TextAlign.start,
    this.length = 100,
    this.focusNode,
    this.onSubmitted,
    this.inputFormatter = '',
    this.validatorType = ''

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
        child: TextFormField(
          style: AppFonts.title.copyWith(color: AppColors.black),
          controller: controller,
          cursorColor: AppColors.black,
          keyboardType: keyboardType,
          textAlign: textAlign,
          maxLength: length,
          maxLines: 1,
          focusNode: focusNode,
          onFieldSubmitted: onSubmitted,
          inputFormatters: inputFormatter=='number'?<TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ]:[],
          validator: validatorType=='phone'?(value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a mobile number';
            }
            // You can customize the regex pattern based on your requirements
            if (!RegExp(r'^(0/91)?[6-9]\d{1}[0-9]\d{9}$').hasMatch(value)) {
              return 'Please enter a valid 10 digit mobile number';
            }
            return null;
          }:null,
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: ''
          ),
        ),
      ),
    );
  }
}