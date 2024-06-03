import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uggiso/Bloc/CreateOrderBloc/CreateOrderEvent.dart';
import 'package:uggiso/Bloc/CreateOrderBloc/CreateOrderState.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedElevatedButton.dart';
import 'package:uggiso/base/common/utils/fonts.dart';
import 'package:uggiso/base/common/utils/strings.dart';

import '../Bloc/CreateOrderBloc/CreateOrderBloc.dart';
import '../app_routes.dart';
import '../base/common/utils/colors.dart';
import 'ui-kit/RoundedContainer.dart';

class CreateOrder extends StatefulWidget {
  final List<Map<String, dynamic>> orderlist;
  final String? restaurantId;
  final String? restaurantName;

  const CreateOrder(
      {Key? key, required this.orderlist, required this.restaurantId,required this.restaurantName})
      : super(key: key);

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  String selectedSlot = '10-15 min';
  double item_total = 0.0;
  double item_sub_total = 0.0;
  double gst_charges = 18.0;
  String userId = '';
  String userNumber = '';
  String userName = '';
  List menuList = [];
  bool showLoader = false;
  final CreateOrderBloc _createOrderBloc = CreateOrderBloc();
  static const platform = MethodChannel('com.sabpaisa.integration/native');

  @override
  void initState() {
    print('this is checkout list : ${widget.orderlist}');
    super.initState();
    getUserDetails();
    for (int i = 0; i < widget.orderlist.length; i++) {
      calculateTotalAmount(
          widget.orderlist[i]['price'], widget.orderlist[i]['quantity']);
      menuList.add({
        "menuId": widget.orderlist[i]['menuId'],
        "quantity": widget.orderlist[i]['quantity'],
        "quantityAmount":
            (widget.orderlist[i]['price'] * widget.orderlist[i]['quantity']),
        "parcelAmount": 5.0,
        "menuName": widget.orderlist[i]['menuName'],
        "photo": null,
        "restaurantMenuType": widget.orderlist[i]['restaurantMenuType']
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBorderColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Hotel Name',
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
      body: BlocProvider(
        create: (context) => _createOrderBloc,
        child: SingleChildScrollView(
            child: BlocListener<CreateOrderBloc, CreateOrderState>(
          listener: (BuildContext context, CreateOrderState state) {
            if (state is LoadingHotelState) {
              showLoader = true;
              CircularProgressIndicator();
            }
            if (state is onLoadedHotelState) {
              print('this is response data : ${state.data}');
              Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.orderSuccessScreen,
                  (Route<dynamic> route) => false);
            }
          },
          child: showLoader
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.appPrimaryColor,
                ))
              : Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/ic_home.png',
                                  width: 24,
                                  height: 24,
                                  color: AppColors.appPrimaryColor,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Distance from Home',
                                    style: AppFonts.title)
                              ],
                            ),
                            Gap(12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(Strings.select_time_slot,
                                    style: AppFonts.title),
                                Gap(24),
                                RoundedContainer(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    color: AppColors.white,
                                    cornerRadius: 8,
                                    padding: 0,
                                    child: DropdownButtonFormField(
                                      decoration: const InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 0),
                                        border: InputBorder.none,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      value: selectedSlot,
                                      menuMaxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      icon: Image.asset(
                                        'assets/ic_dropdown_arrow.png',
                                        width: 12.0,
                                        height: 12.0,
                                      ),
                                      items:
                                          Strings.time_slot.map((String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedSlot = newValue!;
                                        });
                                      },
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(18),
                    Text(
                      Strings.order_details,
                      style: AppFonts.subHeader,
                    ),
                    Gap(18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.white,
                            width: 1,
                          ),
                        ),
                        child: ListView.builder(
                            itemCount: widget.orderlist.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int count) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /*  Image.asset(
                                  'assets/ic_veg.png',
                                  width: 12,
                                  height: 12,
                                ),*/
                                    Gap(4),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Text(
                                          '${widget.orderlist[count]['menuName']}',
                                          style: AppFonts.title,
                                        )),
                                    Gap(12),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text(
                                          '${widget.orderlist[count]['quantity']}',
                                          style: AppFonts.title,
                                        )),
                                    /* RoundedContainer(
                                    width: MediaQuery.of(context).size.width * 0.22,
                                    height:
                                        MediaQuery.of(context).size.height * 0.04,
                                    cornerRadius: 12,
                                    padding: 0,
                                    color: AppColors.appPrimaryColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Gap(6),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              // _orderCount = _orderCount + 1;
                                            });
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            color: AppColors.white,
                                            size: 24,
                                          ),
                                        ),
                                        Text(
                                          '1',
                                          style: AppFonts.title
                                              .copyWith(color: AppColors.white),
                                        ),
                                        Gap(6),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              // _orderCount = _orderCount - 1;
                                            });
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: AppColors.white,
                                            size: 24,
                                          ),
                                        ),
                                      ],
                                    )),*/
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Image.asset(
                                        'assets/ic_edit.png',
                                        width: 12,
                                        height: 18,
                                      ),
                                    ),
                                    /* Gap(12),
                                Image.asset(
                                  'assets/ic_delete.png',
                                  width: 18,
                                  height: 18,
                                ),*/
                                    Gap(24),
                                    Expanded(
                                      child: Text(
                                        'Rs.${widget.orderlist[count]['price']}',
                                        textAlign: TextAlign.end,
                                        style: AppFonts.title,
                                      ),
                                    ),
                                    Gap(18),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                    Gap(18),
                    Text(
                      Strings.bill_details,
                      style: AppFonts.subHeader,
                    ),
                    Gap(18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.white,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Strings.item_total,
                                  style: AppFonts.title,
                                ),
                                Text(
                                  '${item_total}',
                                  style: AppFonts.title,
                                )
                              ],
                            ),
                            Gap(18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Strings.gst_charges,
                                  style: AppFonts.title,
                                ),
                                Text(
                                  '$gst_charges',
                                  style: AppFonts.title,
                                )
                              ],
                            ),
                            Gap(18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Strings.to_pay,
                                  style: AppFonts.title.copyWith(
                                      color: AppColors.appPrimaryColor),
                                ),
                                Text(
                                  '$item_sub_total',
                                  style: AppFonts.title,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Gap(18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.white,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              Strings.note,
                              style: AppFonts.smallText
                                  .copyWith(color: Colors.red),
                            ),
                            Gap(4),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Text(
                                  Strings.note_desc,
                                  style: AppFonts.smallText,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Gap(18),
                    Text(
                      Strings.payment_methods,
                      style: AppFonts.subHeader,
                    ),
                    Gap(100),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RoundedElevatedButton(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 40.0,
                        text: 'PROCEED PAYMENT',
                        textStyle: AppFonts.title,
                        cornerRadius: 8,
                        buttonColor: AppColors.appPrimaryColor,
                        onPressed: () {
                          createOrder();
                        },
                      ),
                    )
                  ],
                ),
        )),
      ),
    );
  }

  calculateTotalAmount(double price, int quantity) {
    setState(() {
      item_total = item_total + (price * quantity);
      item_sub_total = item_total + gst_charges;
    });
  }

  getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('userId') ?? '';
      userNumber = prefs.getString('mobile_number') ?? '';
      userName = prefs.getString('user_name') ?? '';
    });
  }

  createOrder() async {
    print('this is menu list : $menuList');
    print('this is rest id : ${widget.restaurantId!}');
    print('this is user id : $userId');
    print('this is user name : $userName');
    print('this is user number : $userNumber');
    print('this is total amount : ${item_sub_total}');
    /*final List<Object?> result = await platform.invokeMethod('callSabPaisaSdk',
        [userName, "lastname", "flutter@gmail.com", userNumber, item_sub_total.toString()]);*/

    // String txnStatus = result[0].toString();
    // String txnId = result[1].toString();

    // print('this is transaction status : $txnStatus');
    // print('this is transaction id : $txnId');
    // print('this is transaction result : $result');
    /*Fluttertoast.showToast(
        msg: txnStatus,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);*/
    _createOrderBloc.add(OnPaymentClicked(
        restaurantId: widget.restaurantId!,
        restaurantName: widget.restaurantName!,
        customerId: userId,
        menuData: menuList,
        orderType: "PARCEL",
        paymentType: 'UPI',
        orderStatus: 'CREATED',
        totalAmount: item_sub_total.toInt(),
        comments: 'Please do little more spicy',
        timeSlot: 'null',
        transMode: 'BIKE',
        fcmToken: 'hfjhjdjhh'));
  }

}
