import 'package:equatable/equatable.dart';
import 'package:uggiso/Model/otpModel.dart';

import '../../Model/GetFavMenuModel.dart';
import '../../Model/GetFavRestaurantModel.dart';
import '../../Model/GetNearByResaturantModel.dart';

abstract class FavouritesState extends Equatable {
  const FavouritesState();

  @override
  List<Object?> get props => [];
}

class InitialState extends FavouritesState {}

class LoadingState extends FavouritesState {}

class onLoadedHotelState extends FavouritesState {
  final GetNearByRestaurantModel data;
  onLoadedHotelState(this.data);

}
class onLoadedMenuState extends FavouritesState {

  final GetFavMenuModel menuData;
  onLoadedMenuState(this.menuData);
}

class ErrorState extends FavouritesState {
  final String? message;
  const ErrorState(this.message);
}
