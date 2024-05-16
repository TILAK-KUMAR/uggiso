import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class OnInitilised extends HomeEvent {
  final String lat;
  final String lag;

  const OnInitilised({required this.lat,required this.lag});

  @override
  List<Object> get props => [lat,lag];

}
