import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedElevatedButton.dart';
import 'package:uggiso/app_routes.dart';
import 'package:uggiso/base/common/utils/fonts.dart';
import 'package:uggiso/base/common/utils/strings.dart';

import '../base/common/utils/colors.dart';
import 'ui-kit/ImageTitle.dart';
import 'ui-kit/SelectUpiOption.dart';

class PaymentOptionsScreen extends StatefulWidget {
  const PaymentOptionsScreen({super.key});

  @override
  State<PaymentOptionsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  List<String> options = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];
  int selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBg,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          Strings.payment_options,
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
          )
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.preferred_payment,
                style: AppFonts.title,
              ),
              Gap(12),
              PreferredPaymentWidget(),
              Gap(24),
              Text(
                Strings.pay_by_upi_app,
                style: AppFonts.title,
              ),
              Gap(12),
              UpiOptionWidget(),
              Gap(24),
              Text(
                Strings.credit_debit_cards,
                style: AppFonts.title,
              ),
              Gap(12),

            ],
          ),
        ),
      ),
    );
  }

  Widget PreferredPaymentWidget() => RoundedContainer(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      color: AppColors.white,
      borderColor: AppColors.white,
      cornerRadius: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageTitle(
                image: 'assets/ic_phone_pay.png',
                title: Strings.phone_pay_upi,
                imageHeight: 24,
                imageWidth: 24,
                textStyle: AppFonts.title,
              ),
              Image.asset(
                'assets/ic_tick_green.png',
                width: 18,
                height: 18,
              ),
            ],
          ),
          Gap(24),
          Center(
            child: RoundedElevatedButton(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.05,
                text: Strings.proceed_this_payment_option,
                onPressed: () {},
                cornerRadius: 12,
                buttonColor: AppColors.appPrimaryColor,
                textStyle: AppFonts.subHeader.copyWith(
                  color: AppColors.white,
                )),
          )
        ],
      ));

  Widget UpiOptionWidget()=>RoundedContainer(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      cornerRadius: 12,
      color: AppColors.white,
      borderColor: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) =>
                      Column(
                        children: [
                          index == 0
                              ? Container()
                              : Container(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.002,
                            color: AppColors.grey,
                          ),
                          Gap(18),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedRadio = index;
                              });
                            },
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'option',
                                  style: AppFonts.title,
                                ),
                                selectedRadio == index
                                    ? Image.asset(
                                  'assets/ic_tick_green.png',
                                  width: 24,
                                  height: 18,
                                )
                                    : Image.asset(
                                  'assets/ic_circle_grey.png',
                                  width: 24,
                                  height: 18,
                                )
                              ],
                            ),
                          ),
                          Gap(18),
                        ],
                      )),
            ),
          ),
          Gap(8),
          Container(
            height: MediaQuery.of(context).size.height * 0.002,
            color: AppColors.grey,
          ),
          Gap(12),
          ImageTitle(
            image: 'assets/ic_plus_square.png',
            imageHeight: 12,
            imageWidth: 12,
            title: Strings.add_new_upi_id,
            textStyle: AppFonts.smallText
                .copyWith(color: AppColors.appPrimaryColor),
          ),
          Gap(8),
          Text(
            Strings.you_need_to_have_upi_id,
            style: AppFonts.smallText.copyWith(fontSize: 8),
          )
        ],
      ));
}
