import 'package:equatable/equatable.dart';

abstract class FavouritesEvent extends Equatable {
  const FavouritesEvent();
}

class OnGetFavHotel extends FavouritesEvent {
  final String? userId;

  const OnGetFavHotel({required this.userId});
  @override
  List<Object> get props => [userId!];

}

class OnGetFavMenu extends FavouritesEvent{
  final String? userId;


  const OnGetFavMenu({required this.userId});

  @override
  List<Object> get props => [userId!];
}
