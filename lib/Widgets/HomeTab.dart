import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uggiso/Bloc/HomeBloc/HomeBloc.dart';
import 'package:uggiso/Bloc/HomeBloc/HomeEvent.dart';
import 'package:uggiso/Bloc/HomeBloc/HomeState.dart';
import 'package:uggiso/Model/GetNearByResaturantModel.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeBloc.add(OnInitilised(lat:'12.87',lag:'11.56'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeBloc,

      child: BlocBuilder<HomeBloc,HomeState>(
        builder: (BuildContext context, HomeState state){
          if (state is onLoadedHotelState) {
            // Navigate to the next screen when NavigationState is emitted
            // saveNumber(_mobileController.text);
            print('this is state data : ${state.data.payload}');
            return SafeArea(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeaderContainer(),
                GetNearByHotels(state.data.payload),
                // HomeScreen()
              ],
            ));
            // Navigator.pushNamed(context, AppRoutes.verifyOtp);
          } else if (state is ErrorState) {
            // isInvalidCredentials = true;
            return Container();
          }
          else{
            return Container();
          }
        },

      ),
    );
  }

  Widget HomeHeaderContainer() => Container(
    color: AppColors.appPrimaryColor,
    height: MediaQuery.of(context).size.height*0.25,
    width: MediaQuery.of(context).size.width,
  );

  Widget GetNearByHotels(List<Payload>? payload) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Strings.top_rated_eateries_nearby,
              style:AppFonts.title.copyWith(color: AppColors.textGrey),),
            Text(Strings.view_all, style:AppFonts.smallText.copyWith(color: AppColors.textGrey),),
          ],
        ),
        SizedBox(height: 12.0,),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.2,
          child: ListView.builder(
            itemCount: payload?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: NearByHotelCard(payload?[index].restaurantName,payload?[index].restaurantMenuType),
            );
          }),
        ),
        SizedBox(height: 12.0,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Strings.categories,
              style:AppFonts.title.copyWith(color: AppColors.textGrey,),),
            Text(Strings.view_all, style:AppFonts.smallText.copyWith(color: AppColors.textGrey),),
          ],
        ),


      ],
    ),
  );

  Widget NearByHotelCard(String? name,String? foodType) =>RoundedContainer(
      width: MediaQuery.of(context).size.width*0.8,
      height: MediaQuery.of(context).size.height*0.15,
      borderWidth: 2, cornerRadius: 7,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.menuList);
            },
            child: RoundedContainer(
                width: MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.of(context).size.height*0.15,
                color: AppColors.borderColor,
                child: Image.asset('assets/ic_no_hotel.png'), cornerRadius: 10),
          ),
          SizedBox(width: 10.0,),
          Container(
            width: MediaQuery.of(context).size.width*0.42,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.0,),

                Text(name ?? "",
                  style:AppFonts.title.copyWith(color: AppColors.bottomTabInactiveColor),),
                foodType==null?Text(''):Text(foodType!, style:AppFonts.smallText.copyWith(color: AppColors.textGrey),),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/ic_marker.png',height: 18,width: 18,),
                            SizedBox(width: 8.0,),
                            Text('2km'),
                          ],
                        ),

                        Row(
                          children: [
                            Image.asset('assets/ic_star.png',height: 12,width: 12,),
                            Text('4.5',style:AppFonts.smallText.copyWith(color: AppColors.textGrey)),

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
}

