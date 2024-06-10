import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:uggiso/Bloc/MenuListBloc/MenuListBloc.dart';
import 'package:uggiso/Bloc/MenuListBloc/MenuListState.dart';
import 'package:uggiso/Model/GetNearByResaturantModel.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
import 'package:uggiso/base/common/utils/CreateOrderArgs.dart';
import 'package:uggiso/base/common/utils/strings.dart';
import '../Bloc/MenuListBloc/MenuListEvent.dart';
import '../app_routes.dart';
import '../base/common/utils/MenuItemCard.dart';
import '../base/common/utils/colors.dart';
import '../base/common/utils/fonts.dart';

class MenuListScreen extends StatefulWidget {
  final String? restaurantId;
  final String? restaurantName;
  final String? foodType;
  final double? ratings;
  final String? landmark;
  final String? distance;
  final String? duration;
  final Payload? payload;

  const MenuListScreen(
      {super.key,
      required this.restaurantId,
      required this.restaurantName,
      required this.foodType,
      required this.ratings,
      required this.landmark,
      required this.distance,
      required this.duration,
      required this.payload});

  @override
  State<MenuListScreen> createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {
  bool _isVeg = false;
  bool _isNonVeg = false;
  bool _isbestSeller = false;
  bool _showButton = false;
  int _totalItemCount = 0;
  final MenuListBloc _menuListBloc = MenuListBloc();
  final List cartItems = [];
  Map<String, Map<String, dynamic>> uniqueMenuMap = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.restaurantId != null) loadData(widget.restaurantId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBg,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          widget.restaurantName!,
          style: AppFonts.appBarText,
        ),
        leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: IconButton(
              iconSize: 18,
              icon: Image.asset('assets/ic_back_arrow.png'),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      floatingActionButton: _showButton
          ? FloatingActionButton.extended(
              backgroundColor: AppColors.appPrimaryColor,
              onPressed: () {
                List<Map<String, dynamic>> uniqueMenuList = [];
                uniqueMenuMap.clear();
                for (var menu in cartItems) {
                  var menuId = menu['menuId'];
                  if (!uniqueMenuMap.containsKey(menuId) ||
                      menu['quantity'] > uniqueMenuMap[menuId]!['quantity']) {
                    uniqueMenuMap[menuId] = menu;
                  }
                }
                uniqueMenuList = uniqueMenuMap.values.toList();
                Navigator.pushNamed(context, AppRoutes.createOrder,
                    arguments: CreateOrderArgs(
                        orderlist: uniqueMenuList,
                        restaurantId: widget.restaurantId,
                        restaurantName: widget.restaurantName!));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              label: Text(
                'CONTINUE',
                style: AppFonts.title,
              ),
            )
          : Container(),
      body: BlocProvider(
        create: (context) => _menuListBloc,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/ic_gradiant_bg.png'),
                    // Replace 'assets/background_image.png' with your image path
                    fit: BoxFit.cover, // Adjust the BoxFit property as needed
                  ),
                ),
                child: Column(
                  children: [
                    const Gap(24),
                    widget.restaurantName != ''
                        ? Text(
                            widget.restaurantName!,
                            style: AppFonts.appBarText
                                .copyWith(fontWeight: FontWeight.w600),
                          )
                        : Container(),
                    const Gap(12),
                    widget.foodType == 'VEG'
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/ic_veg.png',
                                height: 12,
                                width: 12,
                              ),
                              const Gap(4),
                              Text(
                                'Veg',
                                style: AppFonts.title
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/ic_non_veg.png',
                                height: 12,
                                width: 12,
                              ),
                              const Gap(4),
                              Text(
                                'Non Veg',
                                style: AppFonts.title
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                    const Gap(24),
                    widget.ratings == null
                        ? Container()
                        : RoundedContainer(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.04,
                            cornerRadius: 20,
                            color: AppColors.white,
                            borderColor: AppColors.appPrimaryColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('4.3',
                                    style: AppFonts.title
                                        .copyWith(fontWeight: FontWeight.w500)),
                                Image.asset(
                                  'assets/ic_star.png',
                                  width: 18,
                                  height: 18,
                                )
                              ],
                            ),
                          ),
                    const Gap(24),
                    RoundedContainer(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.05,
                      cornerRadius: 8,
                      color: AppColors.white,
                      borderColor: AppColors.appPrimaryColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex:2,
                            child: Text(
                              '${widget.landmark!} | ',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppFonts.subHeader,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              '${widget.distance!} | ',
                              style: AppFonts.subHeader,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              widget.duration!,
                              style: AppFonts.subHeader,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const Gap(18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.003,
                          color: AppColors.appPrimaryColor,
                        ),
                        const Gap(12),
                        Image.asset(
                          'assets/ic_right_circle.png',
                          width: 12,
                          height: 12,
                        ),
                        const Gap(16),
                        const Text(
                          Strings.menu,
                          style: AppFonts.smallText,
                        ),
                        const Gap(16),
                        Image.asset(
                          'assets/ic_left_circle.png',
                          width: 12,
                          height: 12,
                        ),
                        const Gap(12),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.003,
                          color: AppColors.appPrimaryColor,
                        ),
                      ],
                    ),
                    const Gap(12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isbestSeller = false;
                                _isNonVeg = false;
                                _isVeg = true;
                              });
                            },
                            child: RoundedContainer(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                cornerRadius: 20,
                                color:
                                    _isVeg ? AppColors.grey : AppColors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/ic_veg.png',
                                      height: 12,
                                      width: 12,
                                    ),
                                    const Gap(4),
                                    Text(
                                      Strings.veg,
                                      style: AppFonts.title.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                          ),
                          const Gap(18),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isbestSeller = false;
                                _isNonVeg = true;
                                _isVeg = false;
                              });
                            },
                            child: RoundedContainer(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                cornerRadius: 20,
                                color: _isNonVeg
                                    ? AppColors.grey
                                    : AppColors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/ic_non_veg.png',
                                      height: 12,
                                      width: 12,
                                    ),
                                    const Gap(4),
                                    Text(
                                      Strings.non_veg,
                                      style: AppFonts.title.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                          ),
                          const Gap(18),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isbestSeller = true;
                                _isNonVeg = false;
                                _isVeg = false;
                              });
                            },
                            child: RoundedContainer(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                cornerRadius: 20,
                                color: _isbestSeller
                                    ? AppColors.grey
                                    : AppColors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Gap(4),
                                    Text(
                                      Strings.bestseller,
                                      style: AppFonts.title.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    const Gap(24),
                    BlocBuilder<MenuListBloc, MenuListState>(
                      builder: (context, state) {
                        if (state is FetchingState) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              color: AppColors.white,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: AppColors.appPrimaryColor,
                              )));
                        } else if (state is FetchedListsState) {
                          return state.data?.length == 0
                              ? Center(child: Text('No Items Found'))
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: ListView.builder(
                                      itemCount: state.data?.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return MenuItemCard(
                                          listData: state.data![index],
                                          itemLength: state.data!.length,
                                          onItemAdded: () {
                                            setState(() {
                                              _totalItemCount++;
                                              _showButton = true;
                                            });
                                            cartItems.add({
                                              'menuId': state
                                                  .data![index].menuId
                                                  .toString(),
                                              'menuName': state
                                                  .data![index].menuName
                                                  .toString(),
                                              'menuType': state
                                                  .data![index].menuType
                                                  .toString(),
                                              'price':
                                                  state.data![index].price!,
                                              'restaurantMenuType': state
                                                  .data![index]
                                                  .restaurantMenuType!,
                                              'quantity': 1
                                            });
                                          },
                                          onEmptyCart: (value) {
                                            setState(() {
                                              _totalItemCount--;
                                              if (_totalItemCount == 0)
                                                _showButton = false;
                                            });
                                            cartItems.removeWhere((item) =>
                                                item['menuId'] == value);
                                          },
                                          onQuantityChanged: (int value) {
                                            cartItems.add({
                                              'menuId': state
                                                  .data![index].menuId
                                                  .toString(),
                                              'menuName': state
                                                  .data![index].menuName
                                                  .toString(),
                                              'menuType': state
                                                  .data![index].menuType
                                                  .toString(),
                                              'price':
                                                  state.data![index].price!,
                                              'restaurantMenuType': state
                                                  .data![index]
                                                  .restaurantMenuType!,
                                              'quantity': value
                                            });
                                          },
                                        );
                                      }),
                                );
                        }
                        return Container();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void loadData(String? restId) {
    _menuListBloc.add(onInitialised(id: restId));
  }
}
