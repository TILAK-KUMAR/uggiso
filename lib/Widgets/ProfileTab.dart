import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String userName = '';
  String userNumber = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBg,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: IconButton(
            iconSize: 18,
            icon: Image.asset('assets/ic_back_arrow.png'),
            onPressed: () {
              Navigator.pop(context);

            },
          ),
        ),
        backgroundColor: AppColors.appPrimaryColor,
        title: const Text(
          Strings.myProfile,
          style: AppFonts.appBarText,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ProfileHeader(
            userName: userName,
            mail: userNumber,
            address: '',
            imageUrl: 'assets/ic_person.png',
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: (){Navigator.pushNamed(context, AppRoutes.rewards);},
              child: RoundedContainer(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/ic_coins.png',
                        height: 24,
                        width: 24,
                      ),
                      Gap(8),
                      Text(
                        "Use My Uggiso Coins",
                        style:
                            AppFonts.subHeader.copyWith(color: AppColors.appPrimaryColor),
                      )
                    ],
                  ),
                  color: AppColors.white,
                  borderColor: AppColors.textFieldBorderColor,
                  cornerRadius: 8),
            ),
          ),
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

  Widget ListContainerItem(String icon, String text) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: RoundedContainer(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
            child: Row(
              children: [
                Image.asset(
                  icon,
                  height: 24,
                  width: 24,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  text,
                  style: AppFonts.title.copyWith(color: AppColors.textColor),
                )
              ],
            ),
            color: AppColors.white,
            borderColor: AppColors.textFieldBorderColor,
            cornerRadius: 8),
      );

  goToNextPage(int index) {
    switch (index) {
      case 0:
        return Navigator.pushNamed(context, AppRoutes.myOrders);

      case 1:
        return Navigator.pushNamed(context, AppRoutes.settingsScreen);
      case 2:
        return Navigator.popAndPushNamed(context, AppRoutes.signupScreen);

      case 3:
        return 'Unknown';

      default:
        return 'Unknown';
    }
  }

  void getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userNumber = prefs.getString('mobile_number') ?? '';
      userName = prefs.getString('user_name') ?? '';
    });
  }
}
