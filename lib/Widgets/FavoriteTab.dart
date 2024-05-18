import 'package:flutter/material.dart';
import 'package:uggiso/Widgets/FavMenuTab.dart';
import 'package:uggiso/Widgets/FavRestaurantTab.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/fonts.dart';
import 'package:uggiso/base/common/utils/strings.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> with SingleTickerProviderStateMixin{

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            elevation: 0.0,
            leading: Container(),
            backgroundColor: AppColors.white,
            title: const Text(
              Strings.favorite,
              style: AppFonts.appBarText,
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppColors.grey,
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: AppColors.appPrimaryColor,
                    ),
                    labelStyle: AppFonts.appBarText,
                    labelColor: AppColors.textColor,
                    tabs: [
                      Tab(text: Strings.hotels,),
                      Tab(text: Strings.dishes),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              FavRestaurantTab(),
              FavMenuTab()
            ],
          ),
      ),
    );
  }

}
