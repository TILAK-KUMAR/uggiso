import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uggiso/Bloc/FavouritesBloc/FavouritesEvent.dart';
import 'package:uggiso/Model/MenuListModel.dart';
import '../Bloc/FavouritesBloc/FavouritesBloc.dart';
import '../Bloc/FavouritesBloc/FavouritesState.dart';
import '../base/common/utils/FavMenuItem.dart';
import '../base/common/utils/colors.dart';
import 'Shimmer/HomeScreen.dart';

class FavMenuTab extends StatefulWidget {
  const FavMenuTab({super.key});

  @override
  State<FavMenuTab> createState() => _FavMenuTabState();
}

class _FavMenuTabState extends State<FavMenuTab> {

  final FavouritesBloc _favouritesBloc = FavouritesBloc();
  String? userId='';
  bool _showButton = false;
  int _totalItemCount = 0;

  @override
  void initState() {
    // TODO: implement initState
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
              else if(state is onLoadedMenuState){
                return state.menuData.payload?.length == 0
                    ? Center(child: Text('No Items Found'))
                    : ListView.builder(
                        itemCount: state.menuData.payload?.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder:
                            (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              color: AppColors.white,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
                              child: FavMenuItem(
                                listData: state.menuData.payload![index],
                                itemLength: state.menuData.payload!.length,
                                onItemAdded: () {
                                  setState(() {
                                    _totalItemCount++;
                                    _showButton = true;
                                  });
                                  print(
                                      'this is total item added : $_totalItemCount');
                                },
                                onEmptyCart: () {
                                  setState(() {
                                    _totalItemCount--;
                                    if (_totalItemCount == 0)
                                      _showButton = false;
                                  });

                                  print(
                                      'this is total item delete : $_totalItemCount');
                                },
                              ),
                            ),
                          );
                        });
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
    _favouritesBloc.add(OnGetFavMenu(userId:'b3c54fd0-0659-480b-9def-1cd5ca2432ab'));

  }
}
