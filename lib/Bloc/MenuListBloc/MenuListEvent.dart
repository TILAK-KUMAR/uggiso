import 'package:equatable/equatable.dart';

abstract class MenuListEvent extends Equatable {
  const MenuListEvent();
}

class onInitialised extends MenuListEvent {
  final String? userId;
  final String? restaurantId;


  const onInitialised({required this.userId,required this.restaurantId});

  @override
  List<Object> get props => [userId!,restaurantId!];

  @override
  String toString() => 'OnButtonClicked { number: $userId }';
}

class OnAddFavMenu extends MenuListEvent{
  final String? userId;
  final String? menuId;


  const OnAddFavMenu({required this.userId,required this.menuId});

  @override
  List<Object> get props => [userId!,menuId!];
}

class OnDeleteFavMenu extends MenuListEvent{
  final String? userId;
  final String? menuId;


  const OnDeleteFavMenu({required this.userId,required this.menuId});

  @override
  List<Object> get props => [userId!,menuId!];
}
