import 'package:equatable/equatable.dart';
import 'package:uggiso/Model/GetNearByResaturantModel.dart';
import 'package:uggiso/Model/otpModel.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class InitialState extends HomeState {}

class LoadingHotelState extends HomeState {}

class onLoadedHotelState extends HomeState {
  final GetNearByRestaurantModel data;
  onLoadedHotelState(this.data);
}

class ErrorState extends HomeState {
  final String message;
  ErrorState(this.message);
}