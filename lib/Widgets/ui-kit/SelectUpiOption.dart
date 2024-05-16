import 'package:flutter/material.dart';

import '../../base/common/utils/fonts.dart';
import 'ImageTitle.dart';

class SlectUpiOption extends StatelessWidget {
  final String image;
  final String title;
  final double? imageWidth;
  final double? imageHeight;
  final TextStyle? textStyle;
  final int itemCount;
  final bool isSelected;


  const SlectUpiOption({
    Key? key,
    required this.image,
    required this.title,
    required this.itemCount,
    required this.isSelected,
    this.imageWidth = 10,
    this.imageHeight = 10,
    this.textStyle = AppFonts.smallText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageTitle(
                image: image,
                title: title,
                imageHeight: 24,
                imageWidth: 24,
                textStyle: AppFonts.title,
              ),
              isSelected?Image.asset(
                'assets/ic_tick_green.png',
                width: 18,
                height: 18,
              ):Image.asset(
                'assets/ic_circle_grey.png',
                width: 18,
                height: 18,
              ),

            ],
          );
        });
  }
}
