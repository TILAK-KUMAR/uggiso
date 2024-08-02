import 'package:bloc/bloc.dart';
import 'package:uggiso/Bloc/CreateOrderBloc/CreateOrderEvent.dart';
import 'package:uggiso/Bloc/CreateOrderBloc/CreateOrderState.dart';
import 'package:uggiso/Model/OrderCheckoutModel.dart';
import 'package:uggiso/Network/NetworkError.dart';
import 'package:uggiso/Network/apiRepository.dart';
class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  late OrderCheckoutModel data;
  CreateOrderBloc() : super(InitialState()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<OnPaymentClicked>((event, emit) async {
      try {
        emit(LoadingHotelState());
        data = await _apiRepository.createOrder(event.restaurantId,event.restaurantName, event.customerId,
            event.menuData,event.orderType,event.paymentType,event.orderStatus,event.totalAmount,
        event.comments,event.timeSlot,event.transMode);
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
