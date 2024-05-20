import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uggiso/base/common/utils/strings.dart';

import '../../../Model/MenuListModel.dart';
import '../../../Widgets/ui-kit/RoundedContainer.dart';
import 'colors.dart';
import 'fonts.dart';

class MenuItemCard extends StatefulWidget {
  final Payload listData;
  final int itemLength;

  const MenuItemCard({required this.listData, required this.itemLength});

  @override
  _MenuItemCardState createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  int _orderCount = 0;
  List<GlobalKey<_MenuItemCardState>> _itemKeys = [];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.0005,
          color: AppColors.borderColor,
        ),
        const Gap(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.listData.menuName}',
                  style: AppFonts.title,
                ),
                const Gap(4),
                Text(
                  '${widget.listData.price.toString()}',
                  style: AppFonts.smallText,
                ),
                const Gap(4),
                widget.listData.ratings == null
                    ? Container()
                    : Row(
                  children: [
                    Image.asset(
                      'assets/ic_star.png',
                      width: 12,
                      height: 12,
                    ),
                    const Gap(4),
                    Text('${widget.listData.ratings.toString()}',
                        style: AppFonts.smallText
                            .copyWith(fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              child: Stack(
                children: [
                  RoundedContainer(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.1,
                      cornerRadius: 12,
                      borderColor: AppColors.appPrimaryColor,
                      child: Center(
                          child: Image.asset(
                            'assets/ic_no_image.png',
                            fit: BoxFit.fill,
                          ))),
                  Positioned(
                    top: MediaQuery.of(context).size.height *
                        0.08, // Adjust this value as needed
                    left: 10, // Adjust this value as needed
                    child: RoundedContainer(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.04,
                        cornerRadius: 12,
                        color: AppColors.white,
                        child: _orderCount == 0
                            ? Center(
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _orderCount = 1;
                                  });
                                },
                                child: Text(
                                  Strings.add,
                                  style: AppFonts.smallText.copyWith(
                                      color: AppColors.appPrimaryColor),
                                )))
                            : Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Gap(6),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _orderCount++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: AppColors.appPrimaryColor,
                                size: 18,
                              ),
                            ),
                            Text(
                              '${_orderCount.toString()}',
                              style: AppFonts.smallText.copyWith(
                                  color: AppColors.appPrimaryColor),
                            ),
                            Gap(6),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _orderCount--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: AppColors.appPrimaryColor,
                                size: 18,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
        const Gap(12),
      ],
    );
  }
}