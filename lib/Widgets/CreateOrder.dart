import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uggiso/Widgets/ui-kit/ImageTitle.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedElevatedButton.dart';
import 'package:uggiso/base/common/utils/fonts.dart';
import 'package:uggiso/base/common/utils/strings.dart';

import '../Bloc/CreateOrderBloc/CreateOrderBloc.dart';
import '../base/common/utils/colors.dart';
import 'ui-kit/RoundedContainer.dart';

class CreateOrder extends StatefulWidget {
  const CreateOrder({super.key});

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  String selectedSlot = '10-15 min';
  final CreateOrderBloc _createOrderBloc = CreateOrderBloc();

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
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: InkWell(
              child: Image.asset('assets/ic_back_arrow.png',
                  height: 12, width: 12)),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                        Text('Distance from Home', style: AppFonts.title)
                      ],
                    ),
                    Gap(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(Strings.select_time_slot, style: AppFonts.title),
                        Gap(24),
                        RoundedContainer(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.05,
                            color: AppColors.white,
                            cornerRadius: 8,
                            padding: 0,
                            child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                                border: InputBorder.none,
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              value: selectedSlot,
                              menuMaxHeight:
                                  MediaQuery.of(context).size.height * 0.4,
                              icon: Image.asset(
                                'assets/ic_dropdown_arrow.png',
                                width: 12.0,
                                height: 12.0,
                              ),
                              items: Strings.time_slot.map((String value) {
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
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int count) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/ic_veg.png',
                              width: 12,
                              height: 12,
                            ),
                            Gap(8),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  'title',
                                  style: AppFonts.title,
                                )),
                            Gap(12),
                            RoundedContainer(
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
                                )),
                            Gap(8),
                            Image.asset(
                              'assets/ic_delete.png',
                              width: 18,
                              height: 18,
                            ),
                            Gap(24),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                child: Text(
                                  'Rs 100',
                                  style: AppFonts.title,
                                ))
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
                          '100',
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
                          '100',
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
                          style: AppFonts.title
                              .copyWith(color: AppColors.appPrimaryColor),
                        ),
                        Text(
                          '100',
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
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
                      style: AppFonts.smallText.copyWith(color: Colors.red),
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
                width: MediaQuery.of(context).size.width*0.8,
                height:40.0,
                text: 'PROCEED PAYMENT',
                textStyle: AppFonts.title,
                cornerRadius: 8,
                buttonColor: AppColors.appPrimaryColor,
                onPressed: () {  },
              ),
            )
          ],
        ),
      ),
    );
  }
}
