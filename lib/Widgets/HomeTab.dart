import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uggiso/Bloc/HomeBloc/HomeBloc.dart';
import 'package:uggiso/Bloc/HomeBloc/HomeEvent.dart';
import 'package:uggiso/Bloc/HomeBloc/HomeState.dart';
import 'package:uggiso/Model/GetNearByResaturantModel.dart';
import 'package:uggiso/Widgets/Shimmer/HomeScreen.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
import 'package:uggiso/Widgets/ui-kit/TextFieldCurvedEdges.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import '../app_routes.dart';
import '../base/common/utils/fonts.dart';
import '../base/common/utils/strings.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final HomeBloc _homeBloc = HomeBloc();
  double latitude = 0.0;
  double longitude = 0.0;
  String selectedDistance = '5.0 KM';
  TextEditingController userlocationController = TextEditingController();
  TextEditingController userDistanceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appPrimaryColor,
          leading: Container(),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Image.asset(
                'assets/ic_bell.png',
                width: 28,
                height: 28,
                color: AppColors.white,
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeaderContainer(),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (BuildContext context, HomeState state) {
                if (state is onLoadedHotelState) {
                  print('this is state data : ${state.data.payload}');
                  return GetNearByHotels(state.data.payload);
                  // Navigator.pushNamed(context, AppRoutes.verifyOtp);
                } else if (state is ErrorState) {
                  // isInvalidCredentials =
                  return Expanded(
                    child: Column(
                      children: [
                        Gap(MediaQuery.of(context).size.height * 0.2),
                        Image.asset(
                          'assets/ic_no_hotel.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                        Gap(20),
                        Container(
                          child: Center(
                            child: Text(
                              '${state.message}',
                              style: AppFonts.title,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is LoadingHotelState) {
                  return HomeScreen();
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget HomeHeaderContainer() => Container(
        height: MediaQuery.of(context).size.height * 0.16,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: AppColors.appPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Gap(12),
              RoundedContainer(
                color: AppColors.white,
                  borderColor: AppColors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  cornerRadius: 8,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Current Location',
                        style: AppFonts.title,
                      ),
                      Text(
                        'Change',style: AppFonts.smallText.copyWith(color: AppColors.appPrimaryColor),
                      ),
                    ],
                  )),
              Gap(12),
              RoundedContainer(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05,
                  color: AppColors.white,
                  cornerRadius: 8,
                  padding: 0,
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      border: InputBorder.none,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    value: selectedDistance,
                    menuMaxHeight: MediaQuery
                        .of(context)
                        .size
                        .height * 0.4,
                    icon: Image.asset(
                      'assets/ic_dropdown_arrow.png',
                      width: 12.0,
                      height: 12.0,
                    ),
                    items: Strings.distance_type.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDistance = newValue!;
                      });
                    },
                  )),
            ],
          ),
        ),
      );

  Widget GetNearByHotels(List<Payload>? payload) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.top_rated_eateries_nearby,
                  style: AppFonts.title.copyWith(color: AppColors.textGrey),
                ),
                Text(
                  Strings.view_all,
                  style: AppFonts.smallText.copyWith(color: AppColors.textGrey),
                ),
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  itemCount: payload?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NearByHotelCard(payload?[index].restaurantName,
                          payload?[index].restaurantMenuType),
                    );
                  }),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.categories,
                  style: AppFonts.title.copyWith(
                    color: AppColors.textGrey,
                  ),
                ),
                Text(
                  Strings.view_all,
                  style: AppFonts.smallText.copyWith(color: AppColors.textGrey),
                ),
              ],
            ),
          ],
        ),
      );

  Widget NearByHotelCard(String? name, String? foodType) => RoundedContainer(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.15,
      borderWidth: 2,
      cornerRadius: 7,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.menuList);
            },
            child: RoundedContainer(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.15,
                color: AppColors.borderColor,
                cornerRadius: 10,
                child: Image.asset('assets/ic_no_hotel.png')),
          ),
          SizedBox(
            width: 10.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.42,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18.0,
                ),
                Text(
                  name ?? "",
                  style: AppFonts.title
                      .copyWith(color: AppColors.bottomTabInactiveColor),
                ),
                foodType == null
                    ? Text('')
                    : Text(
                        foodType!,
                        style: AppFonts.smallText
                            .copyWith(color: AppColors.textGrey),
                      ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/ic_marker.png',
                              height: 18,
                              width: 18,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text('2km'),
                          ],
                        ),
                        Row(
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
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ));

  getUserCurrentLocation() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      latitude = prefs.getDouble('user_latitude') ?? 0.0;
      longitude = prefs.getDouble('user_longitude') ?? 0.0;
    });
    _homeBloc
        .add(OnInitilised(lat: latitude.toString(), lag: longitude.toString()));
  }
}
