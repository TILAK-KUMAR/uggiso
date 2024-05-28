import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class MyOrderEvent extends Equatable {
  const MyOrderEvent();
}

class OnFetchOrders extends MyOrderEvent {
  final String customerId;


  const OnFetchOrders({required this.customerId});

  @override
  List<Object> get props => [customerId];
}
