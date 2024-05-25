import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:uggiso/Model/GetNearByResaturantModel.dart';
import 'package:uggiso/Network/constants.dart';
import 'package:uggiso/Widgets/Shimmer/HomeScreen.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/strings.dart';
import '../../Bloc/HomeBloc/HomeBloc.dart';
import '../../Bloc/HomeBloc/HomeEvent.dart';
import '../../Bloc/HomeBloc/HomeState.dart';
import '../../app_routes.dart';
import '../../base/common/utils/MenuListArgs.dart';
import '../../base/common/utils/fonts.dart';

class HotelListGrid extends StatelessWidget {
  final List<dynamic>? payload;

  HotelListGrid(this.payload, {super.key});

  final List<String> items = List.generate(10, (index) => 'Item $index');
  final HomeBloc _homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeBloc,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GridView.builder(
          shrinkWrap: true,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemCount: payload?.length,
          itemBuilder: (context, index) {
            return GridItem(context, payload?[index]);
          },
        ),
      ),
    );
  }

  Widget GridItem(BuildContext c, Payload? item) => RoundedContainer(
      width: MediaQuery.of(c).size.width * 0.3,
      color: AppColors.white,
      borderColor: AppColors.white,
      height: MediaQuery.of(c).size.height,
      cornerRadius: 8,
      child: InkWell(
        onTap: () => Navigator.pushNamed(c, AppRoutes.menuList,
            arguments: MenuListArgs(
                restaurantId: item!.restaurantId,
                name: item.restaurantName,
                foodType: item.restaurantMenuType,
                ratings: item.ratings,
                landmark: item.landmark)),
        child: Stack(
          children: [
            Image.asset(
              'assets/ic_no_hotel.png',
              height: MediaQuery.of(c).size.height * 0.1,
              width: MediaQuery.of(c).size.width,
              fit: BoxFit.fill,
            ),
            Container(
              width: MediaQuery.of(c).size.width * 0.42,
              padding:
                  EdgeInsets.only(top: MediaQuery.of(c).size.height * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 18.0,
                  ),
                  item?.restaurantName == null
                      ? Container()
                      : Text(
                          '${item?.restaurantName}',
                          style: AppFonts.title.copyWith(
                              color: AppColors.bottomTabInactiveColor),
                        ),
                  const Gap(12),
                  item?.restaurantMenuType == null
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            item?.restaurantMenuType == 'VEG'
                                ? Image.asset(
                                    'assets/ic_veg.png',
                                    height: 12,
                                    width: 12,
                                  )
                                : Image.asset(
                                    'assets/ic_non_veg.png',
                                    height: 12,
                                    width: 12,
                                  ),
                            const Gap(4),
                            Text(
                              '${item?.restaurantMenuType}',
                              style: AppFonts.smallText
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                  // Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      item?.ratings == null
                          ? Container()
                          : Row(
                              children: [
                                Image.asset(
                                  'assets/ic_star.png',
                                  height: 12,
                                  width: 12,
                                ),
                                Text('4.5',
                                    style: AppFonts.smallText
                                        .copyWith(color: AppColors.textGrey)),
                              ],
                            ),
                      BlocBuilder<HomeBloc, HomeState>(
                          builder: (BuildContext context, HomeState state) {
                        if (state is LoadingHotelState) {
                          return CircularProgressIndicator(color: AppColors.appPrimaryColor,);
                        } else if (state is onFavHotelAddedState) {
                          return IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/ic_heart_fill.png',
                                width: 24,
                                height: 24,
                              ));
                        } else {
                          return IconButton(
                              onPressed: () {
                                _homeBloc.add(OnAddFavRestaurant(
                                    userId:item?.ownerId,
                                    restaurantId:item?.restaurantId));
                              },
                              icon: Image.asset(
                                'assets/ic_heart.png',
                                width: 24,
                                height: 24,
                              ));
                        }
                      }),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ));
}
