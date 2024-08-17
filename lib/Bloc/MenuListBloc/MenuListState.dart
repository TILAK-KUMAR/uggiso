import 'package:equatable/equatable.dart';
import 'package:uggiso/Model/RemoveFavRestaurantModel.dart';

import '../../Model/AddFavoriteMenuModel.dart';

abstract class MenuListState extends Equatable {
  const MenuListState();

  @override
  List<Object?> get props => [];
}

class FetchListState extends MenuListState {}

class FetchingState extends MenuListState {}

class FetchedListsState extends MenuListState {
  final List? data;
  const FetchedListsState(this.data);
}

class ErrorState extends MenuListState {
  final String? message;
  const ErrorState(this.message);
}

class onFavMenuAddedState extends MenuListState {
  final AddFavoriteMenuModel result;
  onFavMenuAddedState(this.result);
}

class onDeleteMenuAddedState extends MenuListState {
  final RemoveFavRestaurantModel result;
  onDeleteMenuAddedState(this.result);
}
