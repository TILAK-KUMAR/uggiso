import 'package:equatable/equatable.dart';

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