import 'package:equatable/equatable.dart';
import 'package:uggiso/Model/otpModel.dart';

abstract class RegisterUserState extends Equatable {
  const RegisterUserState();

  @override
  List<Object?> get props => [];
}

class InitialState extends RegisterUserState {}

class LoadingState extends RegisterUserState {}

class onLoadedState extends RegisterUserState {
  final String userId;
  onLoadedState(this.userId);
}

class ErrorState extends RegisterUserState {
  final String? message;
  const ErrorState(this.message);
}