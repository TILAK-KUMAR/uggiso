import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uggiso/Bloc/VerifyOtpBloc/VerifyOtpBloc.dart';
import 'package:uggiso/Bloc/VerifyOtpBloc/VerifyOtpState.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedElevatedButton.dart';
import 'package:uggiso/Widgets/ui-kit/TextFieldCurvedEdges.dart';
import 'package:uggiso/app_routes.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/fonts.dart';
import 'package:uggiso/base/common/utils/strings.dart';

import '../Bloc/VerifyOtpBloc/VerifyOtpEvent.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final TextEditingController otpController_1 = TextEditingController();
  final TextEditingController otpController_2 = TextEditingController();
  final TextEditingController otpController_3 = TextEditingController();
  final TextEditingController otpController_4 = TextEditingController();
  final VerifyOtpBloc _verifyOtpBloc = VerifyOtpBloc();
  late Timer _timer;
  bool isResendButtonEnable = false;
  int _secondsRemaining = 30;
  String userContactNumber = '';
  late FocusNode focusNode_1;
  late FocusNode focusNode_2;
  late FocusNode focusNode_3;
  late FocusNode focusNode_4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode_1 = FocusNode();
    focusNode_2 = FocusNode();
    focusNode_3 = FocusNode();
    focusNode_4 = FocusNode();
    startTimer();
    getUserNumber();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _verifyOtpBloc,
      child: BlocListener<VerifyOtpBloc,VerifyOtpState>(

        child: Scaffold(
            backgroundColor: AppColors.white,
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              leading: Container(),
              backgroundColor: AppColors.white,
              elevation: 0.0,
            ),
            body: bodyWidget(context)

        ),
        listener: (BuildContext context, VerifyOtpState state) {
          if (state is onLoadedState) {
            // Navigate to the next screen when NavigationState is emitted
            Navigator.popAndPushNamed(context, AppRoutes.registerUser);
          } else if (state is ErrorState) {
            // isInvalidCredentials = true;
          }
        },
      )
    );
  }

  Widget bodyWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36.0),
              child: Center(
                  child: Image.asset(
                'assets/verify_otp.png',
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.fitWidth,
              )),
            ),
            Center(
                child: Text(Strings.enter_verification_code,
                    style: AppFonts.header
                        .copyWith(color: AppColors.appPrimaryColor))),
            const SizedBox(height: 20.0),
            Center(
                child: Text(Strings.enter_4_digit_code,
                    style:
                        AppFonts.title.copyWith(color: AppColors.textColor))),
            const SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 48.0,
                  width: 48.0,
                  child: TextFieldCurvedEdges(
                    controller: otpController_1,
                    focusNode: focusNode_1,
                    onSubmitted: (_) {
                      _changeFocus(context, focusNode_1, focusNode_2);
                    },
                    backgroundColor: AppColors.appSecondaryColor,
                    keyboardType: TextInputType.number,
                    borderColor: AppColors.textFieldBorderColor,
                    textAlign: TextAlign.center,
                    length: 1,
                    borderRadius: 8,
                  ),
                ),
                SizedBox(
                  height: 48.0,
                  width: 48.0,
                  child: TextFieldCurvedEdges(
                    controller: otpController_2,
                    backgroundColor: AppColors.appSecondaryColor,
                    keyboardType: TextInputType.number,
                    borderColor: AppColors.textFieldBorderColor,
                    textAlign: TextAlign.center,
                    length: 1,
                    borderRadius: 8,
                  ),
                ),
                SizedBox(
                  height: 48.0,
                  width: 48.0,
                  child: TextFieldCurvedEdges(
                    controller: otpController_3,
                    backgroundColor: AppColors.appSecondaryColor,
                    keyboardType: TextInputType.number,
                    borderColor: AppColors.textFieldBorderColor,
                    textAlign: TextAlign.center,
                    length: 1,
                    borderRadius: 8,
                  ),
                ),
                SizedBox(
                  height: 48.0,
                  width: 48.0,
                  child: TextFieldCurvedEdges(
                    controller: otpController_4,
                    backgroundColor: AppColors.appSecondaryColor,
                    keyboardType: TextInputType.number,
                    borderColor: AppColors.textFieldBorderColor,
                    textAlign: TextAlign.center,
                    length: 1,
                    borderRadius: 8,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(Strings.resend_code,
                    style: AppFonts.smallText
                        .copyWith(color: AppColors.textColor))),
            Align(
                alignment: Alignment.centerRight,
                child: isResendButtonEnable
                    ? InkWell(
                        child: RoundedContainer(
                          width: 100,
                          height: 40,
                          cornerRadius: 30,
                          color: AppColors.appSecondaryColor,
                          child: Text(Strings.resend,
                              textAlign: TextAlign.center,
                              style: AppFonts.title
                                  .copyWith(color: AppColors.textColor)),
                        ),
                      )
                    : RoundedContainer(
                        width: 80,
                        height: 40,
                        cornerRadius: 30,
                        color: AppColors.appSecondaryColor,
                        child: Text(_formatTimer(_secondsRemaining),
                            textAlign: TextAlign.center,
                            style: AppFonts.subHeader
                                .copyWith(color: AppColors.textColor)),
                      )),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 30),
                child: RoundedElevatedButton(
                    width: MediaQuery.of(context).size.width,
                    height: 40.0,
                    text: Strings.verify,
                    onPressed: () {
                      String otp = otpController_1.text +
                          otpController_2.text +
                          otpController_3.text +
                          otpController_4.text;
                      _verifyOtpBloc.add(
                          OnButtonClicked(number: userContactNumber, otp: otp));
                    },
                    cornerRadius: 6.0,
                    buttonColor: AppColors.appPrimaryColor,
                    textStyle:
                        AppFonts.header.copyWith(color: AppColors.black)),
              ),
            ),
          ],
        ),
      );

  @override
  void dispose() {
    otpController_1.dispose();
    otpController_2.dispose();
    otpController_3.dispose();
    otpController_4.dispose();
    focusNode_1.dispose();
    focusNode_2.dispose();
    focusNode_3.dispose();
    focusNode_4.dispose();
    super.dispose();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1, minutes: 00);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_secondsRemaining < 1) {
          timer.cancel();
          isResendButtonEnable = true;
        } else {
          _secondsRemaining -= 1;
        }
      });
    });
  }

  String _formatTimer(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  // Method to load the shared preference data
  void getUserNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userContactNumber = prefs.getString('mobile_number') ?? '';
    });
  }

  void _changeFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
