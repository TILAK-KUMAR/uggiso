import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class OnInitilised extends HomeEvent {
  final double lat;
  final double lag;
  final double distance;
  final String userId;

  const OnInitilised({required this.userId,required this.lat,required this.lag,required this.distance});
  @override
  List<Object> get props => [lat,lag];

}

class OnAddFavRestaurant extends HomeEvent{
  final String? userId;
  final String? restaurantId;


  const OnAddFavRestaurant({required this.userId,required this.restaurantId});

  @override
  List<Object> get props => [userId!,restaurantId!];
}
