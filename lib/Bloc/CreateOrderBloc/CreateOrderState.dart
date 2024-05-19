import 'package:equatable/equatable.dart';
import 'package:uggiso/Model/GetNearByResaturantModel.dart';
import 'package:uggiso/Model/otpModel.dart';

abstract class CreateOrderState extends Equatable {
  const CreateOrderState();

  @override
  List<Object?> get props => [];
}

class InitialState extends CreateOrderState {}

class LoadingHotelState extends CreateOrderState {}

class onLoadedHotelState extends CreateOrderState {
  final GetNearByRestaurantModel data;
  onLoadedHotelState(this.data);
}

class ErrorState extends CreateOrderState {
  final String message;
  ErrorState(this.message);
}