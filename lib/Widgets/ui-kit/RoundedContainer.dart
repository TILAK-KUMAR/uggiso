import 'package:flutter/material.dart';
import 'package:uggiso/base/common/utils/colors.dart';

class RoundedContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final double cornerRadius;
  final double borderWidth;
  final Color borderColor;
  final Color color;
  final double padding;

  const RoundedContainer(
      {Key? key,
      required this.width,
      required this.height,
      required this.child,
      required this.cornerRadius,
      this.borderColor = AppColors.borderColor,
      this.color = Colors.transparent,
      this.borderWidth = 1.0,
      this.padding = 8.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      height: height,
      width: width,
      child: child,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
    );
  }
}
