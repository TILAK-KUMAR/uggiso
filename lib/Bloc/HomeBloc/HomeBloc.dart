import 'package:bloc/bloc.dart';
import 'package:uggiso/Bloc/HomeBloc/HomeEvent.dart';
import 'package:uggiso/Bloc/HomeBloc/HomeState.dart';
import 'package:uggiso/Network/NetworkError.dart';
import 'package:uggiso/Network/apiRepository.dart';

import '../../Model/GetNearByResaturantModel.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late GetNearByRestaurantModel data;
  HomeBloc() : super(InitialState()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<OnInitilised>((event, emit) async {
      try {
        emit(LoadingHotelState());
        data = await _apiRepository.getNearbyRestaurant(event.lat, event.lag);
        emit(onLoadedHotelState(data));
      } on NetworkError {
        print('this is network error');
      }
    }
  );
}

}
