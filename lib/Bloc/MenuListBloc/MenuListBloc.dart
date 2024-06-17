import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/AddFavoriteMenuModel.dart';
import '../../Model/MenuListModel.dart';
import '../../Network/NetworkError.dart';
import '../../Network/apiRepository.dart';
import 'MenuListEvent.dart';
import 'MenuListState.dart';

class MenuListBloc extends Bloc<MenuListEvent, MenuListState> {
  MenuListBloc() : super(FetchListState()){
    final ApiRepository _apiRepository = ApiRepository();
    AddFavoriteMenuModel? addFavoriteMenuModel;


    on<onInitialised>((event,emit)async{
      try{
        emit(FetchingState()) ;
        final res = await _apiRepository.getMenuList(event.id);
        if(res.statusCode == 200) {
          final List<Payload>? items = res.payload; // Extract the list from the response
          emit(FetchedListsState(items));
        } else {
          emit(ErrorState(res.message));
        }
      }on NetworkError {
        emit(ErrorState('this is network error'));
      }
    });

    on<OnAddFavMenu>((event, emit) async {
      try {
        emit(FetchingState());
        print('this is userId : ${event.userId}');
        print('this is menu ID : ${event.menuId}');
        if (event.userId == null || event.menuId == null) {
          // Handle the case where userId or restaurantId is null
          print('this is userId : ${event.userId}');
          print('this is restaurant ID : ${event.menuId}');
          emit(ErrorState("userId or restaurantId is null"));
          return;
        }
        addFavoriteMenuModel = (await _apiRepository.addFavMenu(event.userId!, event.menuId!));
        if (addFavoriteMenuModel?.statusCode!=200) {
          emit(ErrorState(addFavoriteMenuModel?.message));
        } else {
          emit(onFavMenuAddedState(addFavoriteMenuModel!));
        }
      } on NetworkError {
        print('this is network error');
      }
    });

  }

}
