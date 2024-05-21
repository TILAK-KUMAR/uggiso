import 'package:flutter/material.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/fonts.dart';
import 'package:uggiso/base/common/utils/strings.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
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
          ),
        ),
        backgroundColor: AppColors.white,
        title: const Text(
          Strings.about_us,
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
                  child: ListContainerItem(
                    Strings.aboutUsItemList[index]['title'],
                    Strings.aboutUsItemList[index]['subtitle'],

                  ),
                );
              })),
    );
  }

  Widget ListContainerItem(String title, String subtitle) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
    child: RoundedContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        color: AppColors.white,
        borderColor: AppColors.textFieldBorderColor,
        cornerRadius: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppFonts.title.copyWith(color: AppColors.textColor),
            ),
            Text(
              subtitle,
              style: AppFonts.subHeader.copyWith(color: AppColors.appPrimaryColor),
            )
          ],
        )),
  );

}
