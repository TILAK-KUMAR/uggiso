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
    'assets/ic_person.png',
    'assets/ic_orders.png',
  ];

  final List<String> text = [
    Strings.home,
    Strings.favorite,
    Strings.profile,
    Strings.orders,
  ];

  static List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    FavoriteTab(),
    ProfileTab(),
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
   /*   floatingActionButton:Container(
        padding: EdgeInsets.all(18),
        width: 64,
        height: 64,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/ic_rectangle.png',
              ),
            )
        ),
        child: Center(
          child: Image.asset(
            'assets/ic_categories.png',
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 70,
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_imagePaths.length, (index) {
                return buildNavBarItem(index);
              }),
            ),
          ),
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
          Image.asset(_imagePaths[index],height: 24,width: 24,
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
