import 'package:flutter/material.dart';
import 'package:uggiso/Widgets/FavoriteTab.dart';
import 'package:uggiso/Widgets/HomeTab.dart';
import 'package:uggiso/Widgets/OrdersTab.dart';
import 'package:uggiso/Widgets/ProfileTab.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/strings.dart';

class HomeLandingScreen extends StatefulWidget {
  const HomeLandingScreen({super.key});

  @override
  State<HomeLandingScreen> createState() => _HomeLandingScreenState();
}

class _HomeLandingScreenState extends State<HomeLandingScreen> {
  int _selectedIndex = 0;

  static const List _imagePaths = [
    'assets/ic_home.png',
    'assets/ic_heart.png',
    'assets/ic_orders.png',
  ];

  final List<String> text = [
    Strings.home,
    Strings.favorite,
    Strings.orders,
  ];

  static List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    FavoriteTab(),
    // ProfileTab(),
    OrdersTab()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height*0.08,
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_imagePaths.length, (index) {
            return buildNavBarItem(index);
          }),
        ),
      ),
    );
  }

  Widget buildNavBarItem(int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(_imagePaths[index],height: 18,width: 18,
            color: _selectedIndex == index ? AppColors.appPrimaryColor : AppColors.bottomTabInactiveColor,
          ),
          SizedBox(height: 4.0,),
          /*Icon(
            icons[index],
            color: _selectedIndex == index ? AppColors.appPrimaryColor : AppColors.bottomTabInactiveColor,
          ),*/
          Text(
            text[index],
            style: TextStyle(
              fontSize: 12,
              color: _selectedIndex == index ? AppColors.appPrimaryColor : AppColors.bottomTabInactiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
