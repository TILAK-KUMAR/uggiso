import 'package:bloc/bloc.dart';
import 'package:uggiso/Bloc/CreateOrderBloc/CreateOrderEvent.dart';
import 'package:uggiso/Bloc/CreateOrderBloc/CreateOrderState.dart';
import 'package:uggiso/Model/OrderCheckoutModel.dart';
import 'package:uggiso/Model/PaymentDetailsModel.dart';
import 'package:uggiso/Network/NetworkError.dart';
import 'package:uggiso/Network/apiRepository.dart';
class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  late OrderCheckoutModel data;
  late PaymentDetailsModel paymentData;
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

    on<OnAddTransactionData>((event, emit) async {
      try {
        emit(LoadPaymentState());
        paymentData = await _apiRepository.addPayDetails(event.orderId,event.receiverId, event.senderId,
            event.status,event.transactionId);
        if(paymentData.payload == null){

          emit(ErrorState(paymentData.message.toString()));
        }
        else{
          emit(PaymentStateLoaded());
        }

      } on NetworkError {
        print('this is network error');
      }
    }
    );
  }

}
