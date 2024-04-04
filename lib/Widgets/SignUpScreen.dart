import 'package:flutter/material.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedElevatedButton.dart';
import 'package:uggiso/Widgets/ui-kit/TextFieldCurvedEdges.dart';
import 'package:uggiso/app_routes.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/fonts.dart';
import 'package:uggiso/base/common/utils/strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: AppColors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(Strings.hi,style: AppFonts.header.copyWith(color: AppColors.black)),
            Text(Strings.uggiso_welcomes_you,style: AppFonts.header.copyWith(color: AppColors.appPrimaryColor)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:36.0),
              child: Center(child: Image.asset('assets/login.png',height: MediaQuery.of(context).size.height*0.25,fit: BoxFit.fitWidth,)),
            ),
            Center(child: Text(Strings.enter_mobile_number,style: AppFonts.subHeader.copyWith(color: AppColors.textColor))),
            const SizedBox(height: 20.0),

            TextFieldCurvedEdges(controller: _mobileController,
                backgroundColor: AppColors.textFieldBg,
                keyboardType: TextInputType.number,
                borderColor: AppColors.textFieldBorderColor),
            const SizedBox(height: 20.0),

            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 30),
                child: RoundedElevatedButton(
                    width: MediaQuery.of(context).size.width,
                    height: 40.0,
                    text: Strings.get_otp,
                    onPressed: (){
                      Navigator.pushNamed(context, AppRoutes.verifyOtp);
                    },
                    cornerRadius: 6.0,
                    buttonColor: AppColors.appPrimaryColor,
                    textStyle:
                    AppFonts.header.copyWith(color: AppColors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }
}
