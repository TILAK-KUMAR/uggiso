import 'package:bloc/bloc.dart';
import 'package:uggiso/Bloc/FavouritesBloc/FavouritesEvent.dart';
import 'package:uggiso/Bloc/FavouritesBloc/FavouritesState.dart';
import 'package:uggiso/Network/apiRepository.dart';

import '../../Model/GetFavMenuModel.dart';
import '../../Model/GetFavRestaurantModel.dart';
import '../../Model/GetNearByResaturantModel.dart';
import '../../Network/NetworkError.dart';


class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(InitialState()){
    final ApiRepository _apiRepository = ApiRepository();
    late GetNearByRestaurantModel data;
    late GetFavMenuModel menuData;


    on<OnGetFavHotel>((event,emit) async{

      try{

        emit(LoadingState()) ;
        data = await _apiRepository.getFavHotel(event.userId!);
        if(data.statusCode==200 && data.payload!.length>0){
            emit(onLoadedHotelState(data));
        }
        else{
          emit(ErrorState(data.message));

        }
      } on NetworkError {
        print('this is network error');
        emit(ErrorState('Network Error..Please Try Later'));
      }
    });

    on<OnGetFavMenu>((event,emit) async{

      try{
        emit(LoadingState()) ;
        menuData = await _apiRepository.getFavMenu(event.userId!);
        if(menuData.statusCode == 200 && menuData.payload!.length>0){
          emit(onLoadedMenuState(menuData));

        }
        else{
          emit(ErrorState(menuData.message));
        }

      } on NetworkError {
        print('this is network error');
      }
    });
  }
}
