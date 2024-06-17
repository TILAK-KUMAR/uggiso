import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:uggiso/Model/AddMenuItemToCart.dart';
import 'package:uggiso/base/common/utils/strings.dart';
import '../../../Bloc/MenuListBloc/MenuListBloc.dart';
import '../../../Bloc/MenuListBloc/MenuListEvent.dart';
import '../../../Bloc/MenuListBloc/MenuListState.dart';
import '../../../Model/MenuListModel.dart';
import '../../../Widgets/ui-kit/RoundedContainer.dart';
import 'Cart.dart';
import 'colors.dart';
import 'fonts.dart';

class MenuItemCard extends StatefulWidget {
  final Payload listData;
  final int itemLength;
  final VoidCallback onItemAdded;
  final ValueChanged<String> onEmptyCart;
  final ValueChanged<int> onQuantityChanged;
  final String userId;

  const MenuItemCard({
    required this.listData,
    required this.itemLength,
    required this.onItemAdded,
    required this.onEmptyCart,
    required this.onQuantityChanged,
    required this.userId,
  });

  @override
  _MenuItemCardState createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  int _orderCount = 0;
  final Cart cart = Cart();
  final MenuListBloc _menuListBloc = MenuListBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _menuListBloc,
      child: Column(
        children: [
          Divider(
            color: AppColors.borderColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.listData.bestSeller!
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: AppColors.appSecondaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            Strings.bestseller,
                            style: AppFonts.smallText,
                          ))
                      : Container(),
                  Gap(8),
                  Row(
                    children: [
                      widget.listData.restaurantMenuType == 'VEG'
                          ? Image.asset(
                              'assets/ic_veg.png',
                              height: 12,
                              width: 12,
                            )
                          : Image.asset(
                              'assets/ic_non_veg.png',
                              height: 12,
                              width: 12,
                            ),
                      Gap(4),
                      Text(
                        '${widget.listData.menuName}',
                        style: AppFonts.title,
                      ),
                    ],
                  ),
                  const Gap(4),
                  Text(
                    '₹ ${widget.listData.price.toString()}',
                    style: AppFonts.smallText,
                  ),
                  const Gap(4),
                  Row(
                    children: [
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
                  BlocBuilder<MenuListBloc, MenuListState>(
                      builder: (BuildContext context, MenuListState state) {
                    if (state is FetchingState) {
                      return Container(
                          child: CircularProgressIndicator(
                              color: AppColors.appPrimaryColor,
                              strokeAlign: -4));
                    } else if (state is onFavMenuAddedState) {
                      return InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/ic_heart_fill.png',
                            width: 22,
                            height: 22,
                          ));
                    } else {
                      return InkWell(
                          onTap: () {
                            _menuListBloc.add(OnAddFavMenu(
                                userId: widget.userId,
                                menuId: widget.listData.menuId));
                          },
                          child: Image.asset(
                            'assets/ic_heart.png',
                            width: 20,
                            height: 20,
                            color: AppColors.appPrimaryColor,
                          ));
                    }
                  }),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                child: Stack(
                  children: [
                    widget.listData.photo == null
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
                            )),
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
                                        /* cart.addItem(AddMenuItemToCart(
                                            menuId: widget.listData.menuId.toString(),
                                            menuName: widget.listData.menuName.toString(),
                                            menuType: widget.listData.menuType.toString(),
                                            price: widget.listData.price!));*/
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
                                          _orderCount--;
                                        });
                                        if (_orderCount == 0) {
                                          widget.onEmptyCart(widget
                                              .listData.menuId
                                              .toString());
                                          cart.removeItem(AddMenuItemToCart(
                                              menuId: widget.listData.menuId
                                                  .toString(),
                                              menuName: widget.listData.menuName
                                                  .toString(),
                                              menuType: widget.listData.menuType
                                                  .toString(),
                                              price: widget.listData.price!));
                                        } else {
                                          widget.onQuantityChanged(_orderCount);
                                        }
                                      },
                                      child: Icon(
                                        Icons.remove,
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
                                          _orderCount++;
                                        });
                                        widget.onQuantityChanged(_orderCount);
                                        /* cart.addItem(AddMenuItemToCart(
                                            menuId: widget.listData.menuId.toString(),
                                            menuName: widget.listData.menuName.toString(),
                                            menuType: widget.listData.menuType.toString(),
                                            price: widget.listData.price!));*/
                                      },
                                      child: Icon(
                                        Icons.add,
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
      ),
    );
  }
}
