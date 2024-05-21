import 'package:flutter/material.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
import 'package:uggiso/app_routes.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/fonts.dart';
import 'package:uggiso/base/common/utils/strings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBg,
      appBar: AppBar(
        elevation: 2.0,
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
        title: const Text(
          Strings.settings,
          style: AppFonts.appBarText,
        ),
        centerTitle: true,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: Strings.profileItemList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => goToNextPage(index),
                  child: ListContainerItem(
                    Strings.settingsItemList[index]['title'],
                    Strings.settingsItemList[index]['subtitle'],

                  ),
                );
              })),
    );
  }

  Widget ListContainerItem(String title, String subtitle) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: RoundedContainer(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            color: AppColors.white,
            borderColor: AppColors.textFieldBorderColor,
            cornerRadius: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFonts.title.copyWith(color: AppColors.textColor),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  subtitle,
                  style: AppFonts.smallText.copyWith(color: AppColors.textColor),
                )
              ],
            )),
      );

  goToNextPage(int index) {
    switch (index) {
      case 0:
        // return Navigator.pushNamed(context, AppRoutes.verifyOtp);
        return 'Unknown';

      case 1:
        return 'Unknown';
      case 2:
        return Navigator.pushNamed(context, AppRoutes.aboutUs);

      case 3:
        return 'Unknown';

      default:
        return 'Unknown';
    }
  }
}
