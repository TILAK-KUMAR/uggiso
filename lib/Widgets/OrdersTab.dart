import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uggiso/Bloc/MyOrderBloc/MyOrderBloc.dart';
import 'package:uggiso/Bloc/MyOrderBloc/MyOrderEvent.dart';
import 'package:uggiso/Bloc/MyOrderBloc/MyOrderState.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';

import '../Model/MyOrdersModel.dart';
import '../base/common/utils/colors.dart';
import '../base/common/utils/fonts.dart';
import '../base/common/utils/strings.dart';

class OrdersTab extends StatefulWidget {
  const OrdersTab({super.key});

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {
  final MyOrderBloc _myOrderBloc = MyOrderBloc();
  String? userId = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.textFieldBg,
        appBar: AppBar(
          elevation: 0,
          leading: Container(),
          backgroundColor: AppColors.appPrimaryColor,
          title: const Text(
            Strings.your_orders,
            style: AppFonts.appBarText,
          ),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => _myOrderBloc,
          child: BlocBuilder<MyOrderBloc, MyOrderState>(
              builder: (BuildContext context, MyOrderState state) {
            if (state is OrderFetchingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.appPrimaryColor,
                ),
              );
            } else if (state is ErrorState) {
              return Center(
                child: Text(
                  '${state.message}',
                  textAlign: TextAlign.center,
                  style: AppFonts.title,
                ),
              );
            } else if (state is OrderFetchedState) {
              return ShowOrderList(state.data);
            }
            return Container();
          }),
        ));
  }

  Widget ShowOrderList(MyOrdersModel data) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
    child: ListView.builder(
        itemCount: data.payload?.length,
        itemBuilder: (BuildContext context, int count) {
          return Container(
            margin: EdgeInsets.only(top: 8.0),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8.0),
              decoration: ShapeDecoration(
                color: AppColors.white,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: AppColors.textFieldBg)),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${data.payload?[count].restaurantName}',
                    style: AppFonts.title,
                  ),
                  Divider(),
                  Gap(12),
                  ListView.builder(
                    itemCount: data.payload?[count].menus?.length,
                      itemBuilder: (BuildContext context,int menuItem){
                    return Text('${data.payload?[count].menus?[menuItem].menuName}');
                  }),
                  Text(
                    'Status : ${data.payload?[count].orderStatus}',
                    style: AppFonts.title,
                  ),
                  Gap(12),
                  Text(
                    'Payment Type : ${data.payload?[count].paymentType}',
                    style: AppFonts.title,
                  ),
                  Gap(12),
                  Text(
                    'Total Amount : Rs. ${data.payload?[count].totalAmount}',
                    style: AppFonts.title,
                  ),
                  Gap(12),
                  Text(
                    'Created At : ${data.payload?[count].orderDate}',
                    style: AppFonts.title,
                  ),
                  Gap(12),
                  Divider(),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Comments : ',
                          style: AppFonts.smallText.copyWith(color: AppColors.appPrimaryColor), // Color for the word "Comments"
                        ),
                        TextSpan(
                          text: '${data.payload?[count].comments}',
                          style: AppFonts.smallText, // Original style for the comments
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        }),
  );

  void getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('userId') ?? '';
    });
    print('this is user id : $userId');
    fetchOrders();
  }

  fetchOrders() {
    _myOrderBloc.add(OnFetchOrders(customerId: userId!));
  }
}
