import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    otpController_1.addListener(() {
      if (otpController_1.text.isNotEmpty) {
        FocusScope.of(context).requestFocus(focusNode_2);
      }
    });
    otpController_2.addListener(() {
      if (otpController_2.text.isNotEmpty) {
        FocusScope.of(context).requestFocus(focusNode_3);
      }
    });
    otpController_3.addListener(() {
      if (otpController_3.text.isNotEmpty) {
        FocusScope.of(context).requestFocus(focusNode_4);
      }
    });
    startTimer();
    getUserNumber();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _verifyOtpBloc,
        child: BlocListener<VerifyOtpBloc, VerifyOtpState>(
          child: Scaffold(
              backgroundColor: AppColors.white,
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                leading: Container(),
                backgroundColor: AppColors.white,
                elevation: 0.0,
              ),
              body: bodyWidget(context)),
          listener: (BuildContext context, VerifyOtpState state) {
            if (state is onLoadedState) {
              // Navigate to the next screen when NavigationState is emitted
              Navigator.popAndPushNamed(context, AppRoutes.registerUser);
            } else if (state is ErrorState) {
              // isInvalidCredentials = true;
            } else if (state is onResendOTPSuccessState) {
              otpController_1.clear();
              otpController_2.clear();
              otpController_3.clear();
              otpController_4.clear();
            }
          },
        ));
  }

  Widget bodyWidget(BuildContext context) =>
      BlocBuilder<VerifyOtpBloc, VerifyOtpState>(builder: (context, state) {
        if (state is onResendOTPSuccessState) {
          // isResendButtonEnable = false;
          // _secondsRemaining = 30;
          // startTimer();
          return mainWidget();
        } else if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.appPrimaryColor,
            ),
          );
        } else if (state is ErrorState) {
          return Center(
            child: Text(
              '${state.message}',
              style: AppFonts.title,
            ),
          );
        } else {
          return mainWidget();
        }
      });

  Widget mainWidget() => Padding(
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
            RawKeyboardListener(
              focusNode: FocusNode(),
              onKey: (RawKeyEvent event) {
                if (event is RawKeyDownEvent &&
                    event.logicalKey == LogicalKeyboardKey.backspace) {
                  // Handle backspace key press
                  if (focusNode_4.hasFocus && otpController_4.text.isEmpty) {
                    focusNode_4.unfocus();
                    otpController_3.clear();
                    FocusScope.of(context).requestFocus(focusNode_3);
                  } else if (focusNode_3.hasFocus &&
                      otpController_3.text.isEmpty) {
                    focusNode_3.unfocus();
                    otpController_2.clear();
                    FocusScope.of(context).requestFocus(focusNode_2);
                  } else if (focusNode_2.hasFocus &&
                      otpController_2.text.isEmpty) {
                    focusNode_2.unfocus();
                    otpController_1.clear();
                    FocusScope.of(context).requestFocus(focusNode_1);
                  }
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildOtpTextField(focusNode_1, otpController_1),
                  buildOtpTextField(focusNode_2, otpController_2),
                  buildOtpTextField(focusNode_3, otpController_3),
                  buildOtpTextField(focusNode_4, otpController_4),
                ],
              ),
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
                        onTap: () {
                          _verifyOtpBloc.add(OnResendOtpButtonClicked(
                              number: userContactNumber));
                        },
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

  Widget buildOtpTextField(
      FocusNode focusNode, TextEditingController controller) {
    return SizedBox(
      height: 48.0,
      width: 48.0,
      child: TextFieldCurvedEdges(
        controller: controller,
        focusNode: focusNode,
        backgroundColor: AppColors.appSecondaryColor,
        keyboardType: TextInputType.number,
        borderColor: AppColors.textFieldBorderColor,
        textAlign: TextAlign.center,
        length: 1,
        borderRadius: 8,
      ),
    );
  }

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
    print('inside timer :  $_secondsRemaining');
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

  void getUserNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userContactNumber = prefs.getString('mobile_number') ?? '';
    });
  }
}
