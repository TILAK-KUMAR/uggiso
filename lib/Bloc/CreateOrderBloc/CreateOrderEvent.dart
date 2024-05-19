import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CreateOrderEvent extends Equatable {
  const CreateOrderEvent();
}

class ObPaymentClicked extends CreateOrderEvent {
  final String lat;
  final String lag;

  const ObPaymentClicked({required this.lat,required this.lag});

  @override
  List<Object> get props => [lat,lag];

}
