import 'package:equatable/equatable.dart';
import 'package:uggiso/Model/otpModel.dart';

abstract class FavouritesState extends Equatable {
  const FavouritesState();

  @override
  List<Object?> get props => [];
}

class InitialState extends FavouritesState {}

class LoadingState extends FavouritesState {}

class onLoadedState extends FavouritesState {}

class ErrorState extends FavouritesState {
  final String? message;
  const ErrorState(this.message);
}
