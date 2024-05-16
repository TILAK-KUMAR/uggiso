import 'package:bloc/bloc.dart';
import 'package:uggiso/Bloc/FavouritesBloc/FavouritesEvent.dart';
import 'package:uggiso/Bloc/FavouritesBloc/FavouritesState.dart';
import 'package:uggiso/Network/apiRepository.dart';


class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(InitialState()){
    final ApiRepository _apiRepository = ApiRepository();

    /*on<OnButtonClicked>((event,emit) async{

      try{

        emit(LoadingState()) ;
        await _apiRepository.verifyOtp(event.number,event.otp);
        emit(onLoadedState());

      } on NetworkError {
        print('this is network error');
      }
    });*/
  }
}
