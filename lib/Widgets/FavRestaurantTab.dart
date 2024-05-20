import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uggiso/Bloc/FavouritesBloc/FavouritesBloc.dart';
import 'package:uggiso/Bloc/FavouritesBloc/FavouritesState.dart';
import 'package:uggiso/Widgets/Shimmer/HomeScreen.dart';
import 'package:uggiso/Widgets/ui-kit/HotelListGrid.dart';

import '../Bloc/FavouritesBloc/FavouritesEvent.dart';
import '../base/common/utils/colors.dart';

class FavRestaurantTab extends StatefulWidget {
  const FavRestaurantTab({super.key});

  @override
  State<FavRestaurantTab> createState() => _FavRestaurantTabState();
}

class _FavRestaurantTabState extends State<FavRestaurantTab> {

  final FavouritesBloc _favouritesBloc = FavouritesBloc();
  String? userId='';

  @override
  void initState() {
    super.initState();
    getUserId();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBorderColor,
      body: BlocProvider(
        create: (context) => _favouritesBloc,
        child: BlocBuilder<FavouritesBloc,FavouritesState>(
          builder: (BuildContext context, FavouritesState state) {
            if(state is ErrorState ){
              return Container(
                child:Center(child: Text(state.message.toString())),

              );
            }
            else if (state is LoadingState){
              return HomeScreen();
            }
            else if(state is onLoadedHotelState){
              return Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: HotelListGrid(state.data.payload),
                ),
              );
            }
            else{
              return Container();
            }

          }
        ),
      ),
    );
  }

  void getUserId() async{
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        userId = prefs.getString('userId') ?? '';
      });
      print('this is user id : $userId');
       _favouritesBloc.add(OnGetFavHotel(userId:'b3c54fd0-0659-480b-9def-1cd5ca2432ab'));

  }
}
