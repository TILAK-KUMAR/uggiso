import 'package:bloc/bloc.dart';
import 'package:uggiso/Bloc/CreateOrderBloc/CreateOrderEvent.dart';
import 'package:uggiso/Bloc/CreateOrderBloc/CreateOrderState.dart';
import 'package:uggiso/Network/NetworkError.dart';
import 'package:uggiso/Network/apiRepository.dart';

import '../../Model/GetNearByResaturantModel.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  late GetNearByRestaurantModel data;
  CreateOrderBloc() : super(InitialState()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<ObPaymentClicked>((event, emit) async {
      try {
        emit(LoadingHotelState());
        // data = await _apiRepository.getNearbyRestaurant(event.lat, event.lag,event.);
        if(data.payload == null){
          emit(ErrorState(data.message.toString()));
        }
        else{
          emit(onLoadedHotelState(data));
        }

      } on NetworkError {
        print('this is network error');
      }
    }
    );
  }

}
