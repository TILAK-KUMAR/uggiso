import 'package:flutter/material.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/fonts.dart';
import 'package:uggiso/base/common/utils/strings.dart';

class ProfileHeader extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final String mail;
  final String address;

  const ProfileHeader({
    Key? key,
    this.imageUrl = 'assets/ic_person.png',
    required this.userName,
    this.mail = '',
    this.address = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(

        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
            topRight: Radius.circular(18),
            topLeft: Radius.circular(18),
          ),
      ),
        padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileRow(context, imageUrl, userName, mail),

            SizedBox(height: 20),

            Text(
              Strings.saved_address,
              style: AppFonts.title.copyWith(color: AppColors.headerColor),
            ),
            SizedBox(height: 10),
            Text(
              address,
              style: AppFonts.subHeader.copyWith(color: AppColors.headerColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget ProfileRow(BuildContext context, String imageUrl, String userName,
          String mail) =>
      Row(
        children: [
          RoundedContainer(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.11,
              cornerRadius: 100,
              color: AppColors.textFieldBorderColor,
              child: Image.asset(
                imageUrl,
                height: 30,
                width: 30,
              )),
          SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: AppFonts.title.copyWith(color: AppColors.textColor),
              ),
              Text(
                mail,
                style: AppFonts.title.copyWith(color: AppColors.textColor),
              )
            ],
          ),
        ],
      );
}
