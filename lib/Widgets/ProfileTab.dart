import 'package:flutter/material.dart';
import 'package:uggiso/Widgets/ui-kit/ProfileHeader.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
import 'package:uggiso/app_routes.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/fonts.dart';
import 'package:uggiso/base/common/utils/strings.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBg,
      appBar: AppBar(
        elevation: 2.0,
        leading: Container(),
        backgroundColor: AppColors.textFieldBg,
        title: const Text(
          Strings.myProfile,
          style: AppFonts.appBarText,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ProfileHeader(
            userName: 'Tilak RK',
            mail: 'iamtilakrk@gmail.com',
            address: 'Varthur Bangalore',
            imageUrl: 'assets/ic_person.png',

          ),
          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RoundedContainer(width: MediaQuery
                .of(context)
                .size
                .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.08,
                child: Row(
                  children: [
                    SizedBox(width: 16.0,),
                    Text("Refer Your Friends", style: AppFonts.title.copyWith(
                        color: AppColors.textColor),)
                  ],
                ),
                color: AppColors.appSecondaryColor,
                borderColor: AppColors.textFieldBorderColor,
                cornerRadius: 8),
          ),
          SizedBox(height: 30,),
          Expanded(
            child: ListView.builder(
              itemCount: Strings.profileItemList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => goToNextPage(index),
                  child: ListContainerItem(
                    Strings.profileItemList[index]['image'],
                    Strings.profileItemList[index]['title'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget ListContainerItem(String icon, String text) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: RoundedContainer(width: MediaQuery
            .of(context)
            .size
            .width,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.08,
            child: Row(
              children: [
                Image.asset(icon, height: 24, width: 24,),
                SizedBox(width: 16.0,),
                Text(text,
                  style: AppFonts.title.copyWith(color: AppColors.textColor),)
              ],
            ),
            color: AppColors.white,
            borderColor: AppColors.textFieldBorderColor,
            cornerRadius: 8),
      );

  goToNextPage(int index) {
    switch (index) {
      case 0 :
        return 'Unknown';

      case 1 :
        return Navigator.pushNamed(context, AppRoutes.settingsScreen);
      case 2 :
        return Navigator.popAndPushNamed(context, AppRoutes.signupScreen);

      case 3 :
        return 'Unknown';

      default :
        return 'Unknown';
    }
  }
}
