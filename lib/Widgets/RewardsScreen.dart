import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uggiso/Widgets/ui-kit/ImageTitle.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/fonts.dart';
import 'package:uggiso/base/common/utils/strings.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFADD8C),
        title: Text(
          Strings.uggiso_coins,
          style: AppFonts.appBarText.copyWith(
              color: AppColors.rewardsText, fontWeight: FontWeight.w600),
        ),
        leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: IconButton(
              icon: Image.asset('assets/ic_back_arrow.png',width: 18,height: 18,color: AppColors.rewardsText,),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFADD8C), // #FADD8C
                    AppColors.appPrimaryColor // #FFB508
                  ],
                  stops: [0.3, 0.9], // Adjust stops as needed
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/ic_uggiso_coin.png',
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.08,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  right: MediaQuery.of(context).size.width * 0.1),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/ic_reward_star.png',
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.05,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25,
                  right: MediaQuery.of(context).size.width * 0.4),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/ic_reward_star.png',
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.05,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3,
                  right: MediaQuery.of(context).size.width * 0.15),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/ic_reward_star.png',
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.05,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(18),
                  Text(
                    Strings.use_uggiso_coins,
                    style: AppFonts.header1
                        .copyWith(color: AppColors.appPrimaryColor),
                  ),
                  Text(
                    Strings.use_uggiso_coins_2,
                    style:
                        AppFonts.header1.copyWith(color: AppColors.rewardsText),
                  ),
                  Gap(MediaQuery.of(context).size.height * 0.1),
                  ImageTitle(
                    image: 'assets/ic_coins.png',
                    imageHeight: 24,
                    imageWidth: 24,
                    imageColor: AppColors.white,
                    title: Strings.coin_equals,
                    textStyle:
                        AppFonts.subHeader.copyWith(color: AppColors.rewardsText),
                  ),
                  Gap(12),
                  ImageTitle(
                    image: 'assets/ic_grey_tag.png',
                    imageHeight: 24,
                    imageWidth: 24,
                    imageColor: AppColors.rewardsText,
                    title: Strings.use_with_coupons,
                    textStyle:
                        AppFonts.subHeader.copyWith(color: AppColors.rewardsText),
                  ),
                  Gap(MediaQuery.of(context).size.height * 0.05),
                  Text(
                    Strings.learn_more,
                    style: AppFonts.title.copyWith(color: AppColors.textBlue),
                  ),
                  Gap(MediaQuery.of(context).size.height * 0.02),
                  Card(
                    color: AppColors.white,
                    elevation: 12,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Strings.uggiso_coin_balance,
                                style: AppFonts.header1
                                    .copyWith(color: AppColors.appPrimaryColor),
                              ),
                              Text(
                                '0',
                                style: AppFonts.header1
                                    .copyWith(color: AppColors.rewardsText),
                              ),
                            ],
                          ),
                          Gap(8),
                          RoundedContainer(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.2,
                              padding: 12,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        Strings.always_use_uggiso_coins,
                                        style: AppFonts.title.copyWith(
                                            color: AppColors.rewardsText,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Switch(
                                        value: switchValue,
                                        onChanged: (value) {
                                          setState(() {
                                            switchValue = value;
                                          });
                                        },
                                        inactiveTrackColor: AppColors.grey,
                                        activeTrackColor: AppColors.appPrimaryColor,
                                        activeColor: AppColors.white,
                                        inactiveThumbColor: Colors.white,
                                      ),
                                    ],
                                  ),
                                  Gap(MediaQuery.of(context).size.height * 0.03),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/ic_tick_green.png',
                                          width: 18, height: 18),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Text(
                                          Strings.uggiso_future_orders,
                                          maxLines: 2,
                                          style: AppFonts.title.copyWith(
                                              color: AppColors.textGreen,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              borderColor: AppColors.rewardsText,
                              cornerRadius: 10),
                          Gap(8),
                        ],
                      ),
                    ),
                  ),
                  Gap(MediaQuery.of(context).size.height * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: ImageTitle(
                      image: 'assets/ic_blue_tag.png',
                      imageHeight: 24,
                      imageWidth: 24,
                      imageColor: AppColors.textBlue,
                      title: Strings.coin_transactions,
                      textStyle:
                          AppFonts.subHeader.copyWith(color: AppColors.textBlue),
                    ),
                  ),
                  Gap(MediaQuery.of(context).size.height * 0.08),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.view_all_transactions,
                            style: AppFonts.subHeader.copyWith(
                                color: AppColors.rewardsText,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset('assets/ic_front_arrow.png',width: 16,height: 16,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
