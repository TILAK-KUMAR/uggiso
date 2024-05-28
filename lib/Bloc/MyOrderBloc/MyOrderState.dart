import 'package:equatable/equatable.dart';
import '../../Model/MyOrdersModel.dart';

abstract class MyOrderState extends Equatable {
  const MyOrderState();

  @override
  List<Object?> get props => [];
}

class InitialState extends MyOrderState {}

class OrderFetchingState extends MyOrderState {}

class OrderFetchedState extends MyOrderState {
  final MyOrdersModel data;
  OrderFetchedState(this.data);
}

class ErrorState extends MyOrderState {
  final String message;
  ErrorState(this.message);
}