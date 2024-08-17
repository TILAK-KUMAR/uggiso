import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uggiso/Bloc/RegisterUserBloc/RegisterUserEvent.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedElevatedButton.dart';
import 'package:uggiso/Widgets/ui-kit/TextFieldCurvedEdges.dart';
import '../Bloc/RegisterUserBloc/RegisterUserBloc.dart';
import '../Bloc/RegisterUserBloc/RegisterUserState.dart';
import '../app_routes.dart';
import '../base/common/utils/colors.dart';
import '../base/common/utils/fonts.dart';
import '../base/common/utils/strings.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({super.key});

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  final TextEditingController _numberController = TextEditingController();
  final RegisterUserBloc _registerUserBloc = RegisterUserBloc();
  String userId ='';


  @override
  void initState() {
    getUserId();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _registerUserBloc,
      child: BlocListener<RegisterUserBloc, RegisterUserState>(
        listener: (BuildContext context, RegisterUserState state) {
          if (state is onReferalComplete) {
            // Navigate to the next screen when NavigationState is emitted

            Navigator.popAndPushNamed(context, AppRoutes.homeScreen);
          } else if (state is ErrorState) {
            _numberController.clear();
            Fluttertoast.showToast(
                msg: state.message.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        },
        child: Scaffold(
                backgroundColor: AppColors.white,
                appBar: AppBar(
                  leading: Container(),
                  backgroundColor: AppColors.white,
                  elevation: 0.0,
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
                      },
                      child:  Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            textAlign: TextAlign.center,
                            Strings.skip,
                            style: AppFonts.subHeader,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BlocBuilder<RegisterUserBloc,RegisterUserState>(
                    builder: (context,state) {
                      if(state is LoadingState){
                        return Center(child: CircularProgressIndicator(color: AppColors.appPrimaryColor,),);
                      }
                      else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Strings.get_rewards,
                                style: AppFonts.header1
                                    .copyWith(color: AppColors
                                    .appPrimaryColor)),
                            const SizedBox(height: 20.0),
                            Text(Strings.share_your_referral,
                                style: AppFonts.subHeader
                                    .copyWith(color: AppColors.textColor)),
                            Text(Strings.appName,
                                style: AppFonts.subHeader
                                    .copyWith(color: AppColors
                                    .appPrimaryColor)),
                            const SizedBox(height: 30.0),
                            Text(Strings.enter_referral_number,
                                style: AppFonts.title.copyWith(color: AppColors
                                    .textColor)),
                            const SizedBox(height: 30.0),
                            TextFieldCurvedEdges(
                              controller: _numberController,
                              backgroundColor: AppColors.textFieldBg,
                              keyboardType: TextInputType.number,
                              borderColor: AppColors.textFieldBorderColor,
                              borderRadius: 6,
                              length: 10,
                            ),
                            const SizedBox(height: 20.0),
                            Expanded(
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                padding: const EdgeInsets.only(bottom: 30),
                                child: RoundedElevatedButton(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    height: 40.0,
                                    text: Strings.submit,
                                    onPressed: () {
                                      print(
                                          'clicked $userId and number : ${_numberController
                                              .text}');
                                      _registerUserBloc.add(OnSubmitReference(
                                          acceptorUuid: userId,
                                          introducerPhone: _numberController
                                              .text));
                                    },
                                    cornerRadius: 6.0,
                                    buttonColor: AppColors.appPrimaryColor,
                                    textStyle:
                                    AppFonts.header.copyWith(
                                        color: AppColors.black)),
                              ),
                            ),
                          ],
                        );
                      }
                    }
                  ),
                ),
        ),
      ),
    );
  }

  void getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('userId')??'';


    });
  }
}
