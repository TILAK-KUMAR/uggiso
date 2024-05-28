import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uggiso/Model/MyOrdersModel.dart';
import 'package:uggiso/Network/NetworkError.dart';
import 'package:uggiso/Network/apiRepository.dart';
import 'MyOrderEvent.dart';
import 'MyOrderState.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  late MyOrdersModel data;

  MyOrderBloc() : super(InitialState()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<OnFetchOrders>((event, emit) async {

      try {
        emit(OrderFetchingState());
        data = await _apiRepository.getMyOrders(event.customerId);
        if (data.payload == null) {
          emit(ErrorState(data.message.toString()));
        } else {
          emit(OrderFetchedState(data));
        }
      } on NetworkError {
        print('this is network error');
      }
    });
  }
}
