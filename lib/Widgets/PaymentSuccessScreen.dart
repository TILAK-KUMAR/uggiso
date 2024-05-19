import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedElevatedButton.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/fonts.dart';
import 'package:uggiso/base/common/utils/strings.dart';

import '../app_routes.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBorderColor,
      appBar: AppBar(
          leading: Container(),
          elevation: 0,
          backgroundColor: AppColors.textFieldBorderColor),
      body: Column(
        children: [
          Image.asset('assets/ic_payment_success.png'),
          Gap(24),
          Text(
            'Yeah !',
            style: AppFonts.header.copyWith(color: AppColors.appPrimaryColor),
          ),
          Gap(18),
          Text(
            Strings.payment_successful,
            style: AppFonts.header,
          ),
          Gap(28),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 50),
              child: RoundedElevatedButton(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 40,
                text: 'Done',
                onPressed: () =>
                    Navigator.popAndPushNamed(context, AppRoutes.homeScreen),
                cornerRadius: 12,
                buttonColor: AppColors.white,
                textStyle: AppFonts.subHeader
                    .copyWith(color: AppColors.appPrimaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
