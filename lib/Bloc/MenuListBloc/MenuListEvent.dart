import 'package:equatable/equatable.dart';

abstract class MenuListEvent extends Equatable {
  const MenuListEvent();
}

class onInitialised extends MenuListEvent {
  final String? id;


  const onInitialised({required this.id});

  @override
  List<Object> get props => [id!];

  @override
  String toString() => 'OnButtonClicked { number: $id }';
}

class OnAddFavMenu extends MenuListEvent{
  final String? userId;
  final String? menuId;


  const OnAddFavMenu({required this.userId,required this.menuId});

  @override
  List<Object> get props => [userId!,menuId!];
}
