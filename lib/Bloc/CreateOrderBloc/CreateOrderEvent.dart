import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CreateOrderEvent extends Equatable {
  const CreateOrderEvent();
}

class OnPaymentClicked extends CreateOrderEvent {
  final String restaurantId;
  final String customerId;
  final List menuData;
  final String orderType;
  final String paymentType;
  final String orderStatus;
  final int totalAmount;
  final String comments;
  final String timeSlot;
  final String transMode;
  final String fcmToken;

  const OnPaymentClicked({required this.restaurantId, required this.customerId,
  required this.menuData,required this.orderType,required this.paymentType,
  required this.orderStatus,required this.totalAmount,required this.comments,required this.timeSlot,
  required this.transMode,required this.fcmToken});

  @override
  List<Object> get props => [restaurantId, customerId];
}
