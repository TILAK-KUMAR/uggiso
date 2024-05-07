import 'package:flutter/material.dart';

import '../base/common/utils/colors.dart';
import '../base/common/utils/fonts.dart';
import '../base/common/utils/strings.dart';

class MenuListScreen extends StatefulWidget {
  const MenuListScreen({super.key});

  @override
  State<MenuListScreen> createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBg,
      appBar: AppBar(
        elevation: 2.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: InkWell(
              child: Image.asset('assets/ic_back_arrow.png',
                  height: 12, width: 12)),
        ),
        backgroundColor: AppColors.white,
        title: const Text(
          Strings.about_us,
          style: AppFonts.appBarText,
        ),
        centerTitle: true,
      ),
    );
  }
}
