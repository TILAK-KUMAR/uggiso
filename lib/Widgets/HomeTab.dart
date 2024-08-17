import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_search_place/google_search_place.dart';
import 'package:google_search_place/model/prediction.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uggiso/Bloc/HomeBloc/HomeBloc.dart';
import 'package:uggiso/Bloc/HomeBloc/HomeEvent.dart';
import 'package:uggiso/Bloc/HomeBloc/HomeState.dart';
import 'package:uggiso/Widgets/Shimmer/HomeScreen.dart';
import 'package:uggiso/Widgets/ui-kit/HotelListGrid.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
import 'package:uggiso/base/common/utils/GetHotelListinMap.dart';
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
  double selectedDistance = 5.0;
  String selectedMode = "BIKE";
  String userId = '';
  bool _isShowMaps = true;
  bool _showPlaceSearchWidget = false;
  String currentLocation = 'Current Location';
  TextEditingController userlocationController = TextEditingController();
  TextEditingController userDistanceController = TextEditingController();
  TextEditingController _placeSearchEditingController = TextEditingController();


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
      child: BlocListener<HomeBloc,HomeState>(
        listener: (BuildContext context, HomeState state) {
          if(state is onFavHotelAddedState){
            print('fav hotel added for lat : $latitude and lng : $longitude, for userId : $userId with travelMode: $selectedMode');
          }
          if(state is onFavHotelDeleteState){
            print('this is result : ${state.result}');
            if(state.result=='success'){
              print('this is inside home tab');

              print('fav hotel deleted for lat : $latitude and lng : $longitude, for userId : $userId with travelMode: $selectedMode');

            }
          }
        },
        child: WillPopScope(
          onWillPop: ()=>exit(0),
          child: Scaffold(
            backgroundColor: AppColors.textFieldBorderColor,
            appBar: AppBar(
              backgroundColor: AppColors.appPrimaryColor,
              leading: IconButton(
                onPressed:(){
                  Navigator.pushNamed(context, AppRoutes.profileScreen);
          
                },
                icon:Image.asset(
                  'assets/ic_person.png',
                  width: 24, // Adjust width as needed
                  height: 24,
                  color: AppColors.white,// Adjust height as needed
                ),
              ),
              elevation: 0,
              actions: [
               /* IconButton(
                  onPressed: ()=>Navigator.pushNamed(context, AppRoutes.rewards),
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/ic_bell.png',
                      color: AppColors.white,
                    ),
                  ),
                ),*/
                /*IconButton(
                  onPressed: ()=>Navigator.pushNamed(context, AppRoutes.rewards),
                  icon: Image.asset(
                    'assets/ic_wallet.png',
                    width: 28,
                    height: 28,
                    color: AppColors.white,
                  ),
                )*/
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.appPrimaryColor,
              onPressed: () {
                setState(() {
                  if (_isShowMaps) {
                    _isShowMaps = false;
                  } else {
                    _isShowMaps = true;
                  }
                });
              },
              tooltip: 'Increment',
              elevation: 8.0,
              child: _isShowMaps
                  ? const Icon(
                Icons.location_on,
                color: AppColors.white,
                size: 32,
              )
                  : const Icon(
                Icons.list_alt_rounded,
                color: AppColors.white,
                size: 32,
              ),
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
                      return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(24),
                                const Text(
                                  Strings.near_by_restaurants,
                                  style: AppFonts.subHeader,
                                ),
                                const Gap(12),
                                _isShowMaps ? HotelListGrid(
                                    state.data.payload,userId,latitude,longitude,selectedMode,selectedDistance):GetHotelListinMap(state.data.payload,userId) ,
                              ],
                            ),
                          ));
                      // Navigator.pushNamed(context, AppRoutes.verifyOtp);
                    } else if (state is ErrorState) {
                      // isInvalidCredentials =
          
                      return Expanded(
                        child: Column(
                          children: [
                            Gap(MediaQuery
                                .of(context)
                                .size
                                .height * 0.2),
                            Image.asset(
                              'assets/ic_no_hotel.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.fitWidth,
                            ),
                            const Gap(20),
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
                      return const HomeScreen();
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget HomeHeaderContainer() =>
      Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.16,
        width: MediaQuery
            .of(context)
            .size
            .width,
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
              const Gap(12),
              _showPlaceSearchWidget
                  ? PlaceSearchWidget()
                  : RoundedContainer(
                  color: AppColors.white,
                  borderColor: AppColors.white,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05,
                  cornerRadius: 8,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          '$currentLocation',
                          style: AppFonts.title,

                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _showPlaceSearchWidget = true;
                          });
                        },
                        child: Text(
                          'Change',
                          style: AppFonts.smallText
                              .copyWith(color: AppColors.appPrimaryColor),
                        ),
                      ),
                    ],
                  )),
              const Gap(12),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: RoundedContainer(
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
                          items: Strings.distance_type.map((double value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text('${value} KM',style: AppFonts.title,),
                            );
                          }).toList(),
                          onChanged: (double? newValue) {
                            setState(() {
                              selectedDistance = newValue!;
                              getNearByRestaurants(userId,
                                  latitude, longitude, selectedDistance,selectedMode);
                            });
                          },
                        )),
                  ),
                  SizedBox(width: 8,),

                  Flexible(
                    flex:2,
                    child: RoundedContainer(
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
                          value: selectedMode,
                          menuMaxHeight: MediaQuery
                              .of(context)
                              .size
                              .height * 0.4,
                          icon: Image.asset(
                            'assets/ic_dropdown_arrow.png',
                            width: 12.0,
                            height: 12.0,
                          ),
                          items: Strings.travel_mode.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text('${value}',style: AppFonts.title,),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedMode = newValue!;
                              getNearByRestaurants(userId,
                                  latitude, longitude, selectedDistance,selectedMode);
                            });
                          },
                        )),
                  ),
                  SizedBox(width: 8,),
                  Flexible(
                    flex: 2,
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, AppRoutes.getRouteMap);
                      },
                      child: RoundedContainer(
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
                          child:Center(child: const Text('By Route', style: AppFonts.title,))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  getUserCurrentLocation() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      latitude = prefs.getDouble('user_latitude') ?? 0.0;
      longitude = prefs.getDouble('user_longitude') ?? 0.0;
      userId = prefs.getString('userId') ?? '';

    });
    getNearByRestaurants(userId,latitude, longitude, selectedDistance,selectedMode);
  }

  getNearByRestaurants(String userId,double lat, double lng, double distance,String mode) {
    print('userId : $userId');
    _homeBloc.add(
        OnInitilised(userId:userId,lat: lat, lag: lng, distance: distance,mode: mode));
  }

  Widget PlaceSearchWidget() =>
      RoundedContainer(
        color: AppColors.white,
        borderColor: AppColors.white,
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.05,
        cornerRadius: 8,
        padding: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: SearchPlaceAutoCompletedTextField(
                  googleAPIKey: 'AIzaSyB8UoTxemF5no_Va1aJn4x8s10VsFlLQHA',
                  textStyle: AppFonts.title,
                  countries: ['in'],
                  isLatLngRequired: true,
                  inputDecoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none, // No border
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  controller: _placeSearchEditingController,
                  itmOnTap: (Prediction prediction) {
                    setState(() {
                      _placeSearchEditingController.text = prediction.description!;
                      currentLocation = _placeSearchEditingController.text;
                      _showPlaceSearchWidget = false;

                    });

                    _placeSearchEditingController.selection =
                        TextSelection.fromPosition(TextPosition(
                            offset: prediction.description?.length ?? 0));

                  },
                  getPlaceDetailWithLatLng: (Prediction prediction) {
                    _placeSearchEditingController.text =
                        prediction.description ?? "";

                    _placeSearchEditingController.selection =
                        TextSelection.fromPosition(TextPosition(
                            offset: prediction.description?.length ?? 0));

                    // Get search place latitude and longitude
                    debugPrint("====>${prediction.lat} ${prediction.lng}");

                    getNearByRestaurants(userId,double.parse(prediction.lat.toString()), double.parse(prediction.lng.toString()), selectedDistance,selectedMode);
                    // Get place Detail
                    debugPrint("Place Detail : ${prediction.placeDetails}");
                  }),
            ),
            Flexible(
                flex: 1,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 12,
                  ),
                  onPressed: () {
                    setState(() {
                      _showPlaceSearchWidget = false;
                      _placeSearchEditingController.clear();
                    });
                  },
                ))
          ],
        ),
      );
}
