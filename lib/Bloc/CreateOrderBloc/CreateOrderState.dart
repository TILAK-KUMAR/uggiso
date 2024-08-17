import 'package:equatable/equatable.dart';
import 'package:uggiso/Model/OrderCheckoutModel.dart';

abstract class CreateOrderState extends Equatable {
  const CreateOrderState();

  @override
  List<Object?> get props => [];
}

class InitialState extends CreateOrderState {}

class LoadingHotelState extends CreateOrderState {}

class LoadPaymentState extends CreateOrderState {}

class PaymentStateLoaded extends CreateOrderState {}


class onLoadedHotelState extends CreateOrderState {
  final OrderCheckoutModel data;
  onLoadedHotelState(this.data);
}

class ErrorState extends CreateOrderState {
  final String message;
  ErrorState(this.message);
}