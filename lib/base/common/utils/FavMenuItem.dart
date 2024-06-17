import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uggiso/Model/GetFavMenuModel.dart';
import 'package:uggiso/base/common/utils/strings.dart';

import '../../../Model/MenuListModel.dart';
import '../../../Widgets/ui-kit/RoundedContainer.dart';
import 'colors.dart';
import 'fonts.dart';

class FavMenuItem extends StatefulWidget {
  final FavMenuPayload listData;
  final int itemLength;
  final VoidCallback onItemAdded;
  final VoidCallback onEmptyCart;

  const FavMenuItem({
    required this.listData,
    required this.itemLength,
    required this.onItemAdded,
    required this.onEmptyCart,
  });

  @override
  _FavMenuItemState createState() => _FavMenuItemState();
}

class _FavMenuItemState extends State<FavMenuItem> {
  int _orderCount = 0;
  List<GlobalKey<_FavMenuItemState>> _itemKeys = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    widget.listData.restaurantMenuType=='VEG'?Image.asset('assets/ic_veg.png',height: 12,
                      width: 12,):Image.asset('assets/ic_non_veg.png',height: 12,
                      width: 12,),
                    Gap(4),
                    Text(
                      '${widget.listData.menuName}',
                      style: AppFonts.title,
                    ),
                  ],
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
                      child: widget.listData.photo == null
                          ? RoundedContainer(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.1,
                          cornerRadius: 12,
                          borderColor: AppColors.appPrimaryColor,
                          child: Center(
                              child: Image.asset(
                                'assets/ic_no_image.png',
                                fit: BoxFit.fill,
                              )))
                          : RoundedContainer(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.1,
                          cornerRadius: 12,
                          borderColor: AppColors.appPrimaryColor,
                          padding: 0,
                          child: Center(
                            child: Image.network(
                              widget.listData.photo.toString(),
                              fit: BoxFit.fill,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                // Display a placeholder image or alternative content
                                return SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.height *
                                      0.08,
                                  child: Center(
                                    child: Image.asset(
                                      'assets/ic_no_image.png',
                                    ),
                                  ),
                                );
                              },
                            ),
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

                                  widget.onItemAdded();
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
                                if(_orderCount==0){
                                  widget.onEmptyCart();
                                }
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
